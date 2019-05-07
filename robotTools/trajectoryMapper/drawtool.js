
$(document).ready(function () {

    $('.csvbutton').prop("disabled", true);
    $('.waypointbutton').prop("disabled", true);
    $('.trackbutton').prop('disabled', true);
    // ************************************************ MenuBar functionality *************************************
    $('#createTrajectoryMenuItem').addClass("active");
    $('#home').hide();
    $('#robotTrackerMenuItemPanel').show();

    function removeActiveClass(){
        if ($('#homeItem').hasClass("active")) {
            $('#homeItem').removeClass("active");
        }
        if ($('#createTrajectoryMenuItem').hasClass("active")) {
            $('#createTrajectoryMenuItem').removeClass("active");

        }
        $('#robotTrackerMenuItemPanel').hide();
        $('#home').hide();
    }

    $('#createTrajectoryMenuItem').click(function () {
        removeActiveClass();
        $('#createTrajectoryMenuItem').addClass("active");
        $('#robotTrackerMenuItemPanel').show();
    });
    $('#homeItem').click(function () {
        removeActiveClass();
        $('#homeItem').addClass("active");
        $('#home').show();
    });

// ************************************************ Map functionality *************************************
    require([
        "esri/Map",
        "esri/layers/FeatureLayer",
        "esri/geometry/Point",
        "esri/views/MapView",
        "esri/views/2d/draw/Draw",
        "esri/Graphic",
        "esri/geometry/support/webMercatorUtils",
        "esri/geometry/Polyline",
        "esri/geometry/geometryEngine",

        "dojo/domReady!"
    ], function(
        Map, FeatureLayer, Point, MapView,
        Draw, Graphic, webMercatorUtils,
        Polyline, geometryEngine
    ) {
        let polypoints;
        let trajectoryLayer;

        var map = new Map({
            basemap: "satellite",
            layers: []
        });

        var view = new MapView({
            container: "viewDiv",
            map: map,
            zoom: 16,
            center: [3.777733632,50.982658349]
        });

        // add the button for the draw tool
        view.ui.add("line-button", "top-left");

        view.when(function(event) {
            var draw = new Draw({
                view: view
            });

            // ********************
            // draw polyline button
            // ********************
            var drawLineButton = document.getElementById("line-button");
            drawLineButton.onclick = function() {
                view.graphics.removeAll();
                enableCreateLine(draw, view);
            }
        });

        function enableCreateLine(draw, view) {
            // creates and returns an instance of PolyLineDrawAction
            // can only draw a line by clicking on the map
            var action = draw.create("polyline", {
                mode: "click"
            });

            // focus the view to activate keyboard shortcuts for sketching
            view.focus();

            // listen to vertex-add event on the polyline draw action
            action.on("vertex-add", updateVertices);

            // listen to vertex-remove event on the polyline draw action
            action.on("vertex-remove", updateVertices);

            // listen to cursor-update event on the polyline draw action
            action.on("cursor-update", createGraphic);

            // listen to draw-complete event on the polyline draw action
            action.on("draw-complete", updateVertices);

            action.on("")
        }

        // This function is called from the "vertex-add" and "vertex-remove"
        // events. Checks if the last vertex is making the line intersect itself.
        function updateVertices(event) {
            // create a polyline from returned vertices
            var result = createGraphic(event);

            // *****************************Save the corner coordinates******************************
            let line = result.graphic.geometry.clone();
            polypoints = [];
            console.log("the new points are: ");

            let i = 0;
            let point = line.getPoint(0, i);
            while (point){
                polypoints.push([point.x, point.y]);
                console.log("longlat: " + [point.longitude, point.latitude] + " or xy: " + [point.x, point.y]);
                i++;
                point = line.getPoint(0, i);
            }
            console.log(polypoints);

            if (polypoints.length >= 4) {
                $('.trackbutton').prop('disabled', false);
            } else {
                $('.trackbutton').prop('disabled', true);
            }
            // ***************************************************************************************

            // if the last vertex is making the line intersects itself,
            // prevent "vertex-add" or "vertex-remove" from firing
            if (result.selfIntersects) {
                event.preventDefault();
            }
        }

        // create a new graphic presenting the polyline that is being drawn on the view
        function createGraphic(event) {
            var vertices = event.vertices;
            view.graphics.removeAll();

            // a graphic representing the polyline that is being drawn
            var graphic = new Graphic({
                geometry: new Polyline({
                    paths: vertices,
                    spatialReference: view.spatialReference
                }),
                symbol: {
                    type: "simple-line", // autocasts as new SimpleFillSymbol
                    color: [4, 90, 141],
                    width: 4,
                    cap: "round",
                    join: "round"
                }
            });

            // check the polyline intersects itself.
            var intersectingFeature = getIntersectingFeature(graphic.geometry);

            // Add a new graphic for the intersecting segment.
            if (intersectingFeature) {
                view.graphics.addMany([graphic, intersectingFeature]);
            }
            // Just add the graphic representing the polyline if no intersection
            else {
                view.graphics.add(graphic);
            }

            // return the graphic and intersectingSegment
            return {
                graphic: graphic,
                selfIntersects: intersectingFeature
            }
        }

        // function that checks if the line intersects itself
        function isSelfIntersecting(polyline) {
            if (polyline.paths[0].length < 3) {
                return false
            }
            var line = polyline.clone();

            //get the last segment from the polyline that is being drawn
            var lastSegment = getLastSegment(polyline);
            line.removePoint(0, line.paths[0].length - 1);

            // returns true if the line intersects itself, false otherwise
            return geometryEngine.crosses(lastSegment, line);
        }

        // Checks if the line intersects itself. If yes, changes the last
        // segment's symbol giving a visual feedback to the user.
        function getIntersectingFeature(polyline) {
            if (isSelfIntersecting(polyline)) {
                return new Graphic({
                    geometry: getLastSegment(polyline),
                    symbol: {
                        type: "simple-line", // autocasts as new SimpleLineSymbol
                        style: "short-dot",
                        width: 3.5,
                        color: "yellow"
                    }
                });
            }
            return null;
        }

        // Get the last segment of the polyline that is being drawn
        function getLastSegment(polyline) {
            var line = polyline.clone();
            var lastXYPoint = line.removePoint(0, line.paths[0].length - 1);
            var existingLineFinalPoint = line.getPoint(0, line.paths[0].length -
                1);

            return new Polyline({
                spatialReference: view.spatialReference,
                hasZ: false,
                paths: [
                    [
                        [existingLineFinalPoint.x, existingLineFinalPoint.y],
                        [lastXYPoint.x, lastXYPoint.y]
                    ]
                ]
            });
        }

        // ***********************************************For drawing the trajectory coordinates***************************************
        var customRenderer =  {
            type: "simple", // autocasts as new SimpleRenderer()
            symbol: {
                type: "simple-marker",  // autocasts as new SimpleMarkerSymbol()
                size: "4px",
                color: "red",
                outline: {  // autocasts as new SimpleLineSymbol()
                    width: 0.2,
                    color: "white"
                }
            }
        };

        var fields = [
            {
                name: "ObjectId",
                alias: "ObjectId",
                type: "oid"
            }, {
                name: "longitude",
                alias: "longitude",
                type: "number"
            }, {
                name: "latitude",
                alias: "latitude",
                type: "number"
            }
        ];

        let trackpointsocket, pointarray;
        $('#createTrackPointsbutton').click(function () {
            trackpointsocket = new WebSocket("ws://localhost:8003");

            trackpointsocket.onopen = function (event) {
                console.log("TCP connection established");

                let row_width = $('#row_width_input').val();
                let distance_width = $('#distance_between_points_input').val();

                trackpointsocket.send(JSON.stringify({
                    type: "cornerpoints",
                    points: polypoints.slice(0,4),
                    row_width: row_width,
                    distance_width: distance_width
                }));

                trajectoryLayer = new FeatureLayer({
                    name: "trajectoryLayer",
                    source: [],
                    fields: fields,
                    objectIdField: "ObjectId",
                    renderer: customRenderer,
                    geometryType: "point"
                });
                map.layers.push(trajectoryLayer);
            };

            trackpointsocket.onclose = function (event) {
                console.log("TCP connection closed");
            };

            trackpointsocket.onmessage = function (event) {
                let myjson = JSON.parse(event.data);

                let cnt = 0;
                pointarray = [];
                for (let xyco of myjson.trackpoints) {
                    let lnglatco = webMercatorUtils.xyToLngLat(xyco[0], xyco[1]);
                    pointarray.push(lnglatco);
                    let point = new Point({longitude: lnglatco[0], latitude: lnglatco[1]});
                    trajectoryLayer.source.push({
                        geometry: point,
                        attributes: {
                            objectId: cnt,
                            longitude: lnglatco[0],
                            latitude: lnglatco[1]
                        }
                    });
                    cnt++;
                }
            };

            trackpointsocket.onerror = function (event) {
                console.log(event.data);
            };

            $('.csvbutton').prop("disabled", false);
            $('.waypointbutton').prop("disabled", false);
        });

        // *****************************File Creation*****************************************
        $('#createCSVFileButton').click(function () {
            if (pointarray){
                trackpointsocket.send(JSON.stringify({type: "csvfilepoints", co: pointarray}));
            }
        });

        $('#createWaypointFileButton').click(function () {
            if (pointarray){
                trackpointsocket.send(JSON.stringify({type: "waypointfilepoints", co: pointarray}));
            }
        });
    });

});
