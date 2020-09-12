var d3 = require("d3");

import {
    Gradients
} from './gradients';

import {
    lv_wm_paths
} from './lv_wm_paths';
//diverging ['#d53e4f','#fc8d59','#fee08b','#e6f598','#99d594','#3288bd']
const motion_colors_2 = [{
        "mvalue": "1",
        "color": "#d53e4f",
        "value": "Normal"
    },
    {
        "mvalue": "2",
        "color": "#fc8d59",
        "value": "Moderate Hypokenesia"
    },
    {
        "mvalue": "3",
        "color": "#fee08b",
        "value": "Sever Hypokenesis"
    },
    {
        "mvalue": "4",
        "color": "#e6f598",
        "value": "Akenesia"
    },
    {
        "mvalue": "5",
        "color": "#99d594",
        "value": "Dyskenesia"
    },
    {
        "mvalue": "6",
        "color": "#3288bd",
        "value": "None Aux"
    }
]

// sequential ['#f1eef6','#d4b9da','#c994c7','#df65b0','#dd1c77','#980043']
// ['#f0f9e8','#ccebc5','#a8ddb5','#7bccc4','#43a2ca','#0868ac']
const motion_colors = [{
        "mvalue": "1",
        "color": "#f0f9e8",
        "value": "Normal"
    },
    {
        "mvalue": "2",
        "color": "#ccebc5",
        "value": "Moderate Hypokenesia"
    },
    {
        "mvalue": "3",
        "color": "#a8ddb5",
        "value": "Sever Hypokenesis"
    },
    {
        "mvalue": "4",
        "color": "#7bccc4",
        "value": "Akenesia"
    },
    {
        "mvalue": "5",
        "color": "#43a2ca",
        "value": "Dyskenesia"
    },
    {
        "mvalue": "0",
        "color": "#a50f15",
        "value": "No Data"
    }
]

//['#7fc97f','#beaed4','#fdc086','#ffff99','#386cb0','#f0027f']
// sequential = ['#feebe2','#fcc5c0','#fa9fb5','#f768a1','#c51b8a','#7a0177']

class Utility {
    constructor() {

    }

    show_xy() {
        let x = null;
        var y = null;


        let coordinates = d3.mouse(this);
        x = coordinates[0];
        y = coordinates[1];

        console.log("x: " + x + "y: " + y);

    }; //show_x_y

    color_gradient(element) {

        let gradients = new Gradients()
        let frame_element = d3.selectAll("#frame_element")
        //gradients.linear(element, "frame_gradient", "#0A7E8C","#0081AB")
        gradients.linear(element, "frame_gradient", "#43464B", "#D1DBDD")
        //Big Dip O' Ruby-Blast Off Bronze
        // gradients.radial(element, "frame_gradient", "red","green")

        let arterial_gradient = gradients.linear(element, "arterial_gradient", "#d94701", "white")

        let vein_gradient = gradients.radial(element, "vein_gradient", "#6baed6", "white")
        let stent_gradient = gradients.linear(element, "stent_gradient", "#92c5de", "#0571b0")



    }
    ///////////////////
}; //class Utility

/////////////

class Segments_graph {
    constructor(group) {
        this.group = group;
        this.data = lv_wm_paths;



        this.draw_graph(this.data);


    }; //constructor

    draw_rect(group, start_x, start_y, width, height) {

        let g_rect = group.append('rect')
            .attr("id", "graph_group_rect")
            .attr("x", start_x)
            .attr("y", start_y)
            .attr("rx", 2.5)
            .attr("ry", 2.5)
            .attr("width", width)
            .attr("height", height)
            .attr("stroke-width", 3)
            .attr("stroke", "#ddd")
            .style("fill", "none");

        return g_rect



    }
    draw_graph(data) {
        //;console.log("drawing graph DATA: "+ JSON.stringify(this.data))
        const start_x = 55;
        const start_y = 205;
        let util = new Utility();
        let margin = {
                top: 30,
                right: 20,
                bottom: 30,
                left: 50
            },
            width = 850 - margin.left - margin.right,
            height = 300 - margin.top - margin.bottom;

        let graph_group = this.group.append('g')
            .attr("id", "lv_graph_g")
            .attr('transform', "translate(0, 650)");


        // let rect_group = this.draw_rect(graph_group, start_x, start_y, width, height);
        //    rect_group.on("mouseover", util.show_xy);

        var x = d3.scaleBand()
            .range([0, width])
            .padding(0.5);

        var y = d3.scaleLinear()
            .range([height, 0]);
        // format the data

        data.forEach(function (d) {
            d.motion = +d.motion;
        });

        let segm_data = [];

        data.forEach(function (k, v) {
            if (k.wall_segment == "Y") {
                //console.log(k.wall_segment)
                segm_data.push(k);
            };
        })


        let get_color = (a_motion) => {
            let stroke = ""
            motion_colors.forEach(function (k, v) {
                if (k.mvalue == a_motion) {
                    stroke = k.color
                };
            })

            return stroke;
        }; //get_color


        x.domain(segm_data.map(function (d) {
            return d.label;
        }));
        y.domain([0, d3.max(segm_data, function (d) {
            return d.motion;
        })]);

        // append the rectangles for the bar chart

        graph_group.selectAll(".bar")
            //.data(data)
            .data(segm_data)
            .enter().append("rect")
            .attr("id", function (d) {
                "graph" + d.label
            })
            .attr("class", "bar")
            .attr("x", function (d) {
                return x(d.label);
            })
            .attr("width", x.bandwidth())
            .attr("y", function (d) {
                return y(d.motion);
            })
            .style("fill", d => {
                let fill = get_color(d.motion)
                return fill
            })
            .attr("height", function (d) {
                return height - y(d.motion)
            })
            .append('title')
            .text((d) => {
                return " Segment: " + d.label + " " + " Score: " + d.motion
            });

        graph_group.append("g")
            .attr("transform", "translate(0," + height + ")")
            .style("stroke", "#fff")
            .style("font-size", "14px")
            .call(d3.axisBottom(x))
            .selectAll("text")
            .style("text-anchor", "end")
            .attr("dx", "-.8em")
            .attr("dy", ".15em")
            .attr("transform", "rotate(-65)");

        // add the y Axis
        graph_group.append("g")
            .style("stroke", "#fff")
            .style("font-size", "14px")
            .call(d3.axisLeft(y));



        let legend = graph_group.append("text")
            .attr("x", 0)
            .attr("y", margin.top - 45)
            .style("fill", "#fff")
            .style("font-size", "14px")
            .text("Segmental Wall Motion Abnormalities (1 = Normal, 5 = Dyskenesis ) ")
        /*
                let rect_lu = this.draw_rect(graph_group, 60, 220, 20, 20);
                let rect_ld = this.draw_rect(graph_group, 60, 435, 20, 20);
                let rect_ru = this.draw_rect(graph_group, 822, 220, 20, 20);
                let rect_rd = this.draw_rect(graph_group, 822, 435, 20, 20);
                */


    }; //draw_graph

    /////////////////////
}; //class Segments_graph



class Color_index {
    constructor(group) {
        this.group = group;

    }
    make(colors) {
        const start_y = 10
        const start_x = 10
        const height = 70
        const width = 25
        const step = 70
        let colors_group = this.group.append('g')
            .attr('transform', "translate(650, -50)");

        motion_colors.forEach(function (k, v) {
            let mvalue = k.mvalue;

            let color_value = k.color
            let rect = colors_group.append('rect')
                .attr("id", "frame_element")
                .attr("x", start_x)
                .attr("y", step * mvalue)
                .attr("rx", 2.5)
                .attr("ry", 2.5)
                .attr("width", width)
                .attr("height", height)
                .attr("stroke-width", 1)
                .style("fill", color_value);

            const title = rect.append('title');
            title.text("Motion: " + k.value);


        })

    }; //make

    draw_rect(group, step, color) {
        let rect = group.append('rect')
            .attr("id", "frame_element")
            .attr("x", start_x)
            .attr("y", start_y + step)
            .attr("rx", 2.5)
            .attr("ry", 2.5)
            .attr("width", width)
            .attr("height", height)
            .attr("stroke-width", 1)
            .style("fill", color);

    }

}; //class Color_index

////////////////
class Guides {
    constructor() {

    }

    make_bullets(svg) {
        let property = new Utility();

        let margin = {
                top: 30,
                right: 20,
                bottom: 30,
                left: 50
            },
            width = 1100 - margin.left - margin.right,
            height = 1300 - margin.top - margin.bottom;

        let start_x = 25;
        let start_y = 25;
        let rca_ostium_x = 290.625 - 15;
        let rca_ostium_y = 461.73721 + 12.5;
        let lm_ostium_x = 290.625 + 15;
        let lm_ostium_y = 461.73721 - 12.5;
        //let  rca_ostium_x=  304.6875 ;
        //let rca_ostium_y=  536.73721;
        //let  lm_ostium_x=   368.30218;
        //let  lm_ostium_y=  504.55492;

        let rect = svg.append('rect')
            .attr("id", "frame_element")
            .attr("x", start_x)
            .attr("y", start_y)
            .attr("rx", 12.5)
            .attr("ry", 12.5)
            //.attr("width", 950)
            //.attr("height", 1150)
            .attr("width", width)
            .attr("height", height)
            .attr("stroke-width", 15)
            .style("stroke", "url(#frame_gradient)");

        let rect2 = svg.append('rect')
            .attr("id", "frame_element")
            .attr("x", start_x + 10)
            .attr("y", start_y + 10)
            .attr("rx", 6.125)
            .attr("ry", 6.125)
            //.attr("width", 930)
            //.attr("height", 1130)
            .attr("width", width - 20)
            .attr("height", height - 20)
            .attr("stroke-width", 12)
            //  .style("stroke", "#bdbdbd");
            .style("stroke", "url(#frame_gradient)");

        let rect3 = svg.append('rect')
            .attr("id", "frame_element")
            .attr("x", start_x + 20)
            .attr("y", start_y + 20)
            .attr("rx", 3.63)
            .attr("ry", 3.63)
            .attr("width", width - 40)
            .attr("height", height - 40)
            //.attr("width", 910)
            //.attr("height", 1110)
            .attr("stroke-width", 7)
            // .style("stroke", "#636363");
            .style("stroke", "url(#frame_gradient)");

        let bullets_group = svg.append('g')
            //  .attr('transform', "translate(0, 0)");
            .attr('transform', "translate(150, 150)");

        let bullets_color = property.color_gradient(bullets_group)


        let rca_bullet = bullets_group.append("circle")
            .attr("cx", rca_ostium_x)
            .attr("cy", rca_ostium_y)
            .attr("r", 5.0)
            .style("stroke-width", 1)
            .style("stroke", "url(#stent_gradient)")
            .style("fill", "url(#arterial_gradient)");

        let lm_bullet = bullets_group.append("circle")
            .attr("cx", lm_ostium_x)
            .attr("cy", lm_ostium_y)
            .attr("r", 5.0)
            .style("stroke-width", 1)
            .style("stroke", "url(#stent_gradient)")
            .style("fill", "url(#vessel_gradient)");

        return bullets_group;




    } //make_bullets

    message(d3, a_text) {
        let area = d3.select(".info_area");
        let area_g = area.append('g');

        area_g.text(a_text)
            .transition()
            .duration(7000)
            .style('opacity', 0.9)
            .duration(2000)
            .style('opacity', 0.6)
            .duration(2000)
            .style('opacity', 0.3)
            .duration(3000)
            .remove(this);


    }; //message

} //class Guides
////////////////
class SetLv {
    constructor() {}

    svg() {

        let container = d3.select("#d3_lv_parent_canvas")

        let svg = container.append("svg");
        svg.attr("id", "main_svg")
        svg.attr({
            "width": "100%",
            "height": "100%"
        });
        svg.attr("viewBox", "0 0 " + 1100 + " " + 1300);
        svg.attr("preserveAspectRatio", "xMidYMid meet");
        svg.attr("pointer-events", "all");
        svg.style("margin-left", "0%");
        svg.style("margin-right", "0%");
        svg.style("margin-top", "0%");
        svg.style("margin-bottom", "0%");
        svg.style("background-color", "#000");
        svg.style("cursor", "move");
        svg.style("shape-rendering", "crispEdges");
        svg.call(this.zoom());

        return svg;
    }; //svg

    zoom() {
        let a_zoom = d3.zoom().on("zoom", function () {
            let svg_vis = d3.select('#svg_vis');
            // console.log("svg_vis: "+ JSON.stringify(svg_vis))
            svg_vis.attr("transform", d3.event.transform);
        });
        return a_zoom;
    }; //zoom


    vis() {
        let svg_vis = this.svg();
        let vis = svg_vis.append('svg:g')
            .attr('id', 'svg_vis');
        return vis;
    }



    //////////////////////
}; //class SetLv
class Prepare_data {
    constructor() {
        this.build_data();

    };

    build_data() {
        let db_data = CATH_LVETRICLE_DATA;
        for (let k in db_data['cath_lventricle']) {
            const v = db_data['cath_lventricle'][k];
            for (let t of Array.from(lv_wm_paths)) {
                if (k === t.id) {
                    //console.log(v)
                    //t.motion = v;
                    if (v == null) {
                        t.motion = 0
                    } else {
                        t.motion = v
                    }

                }
            }
        }

    }; //build_data

}; //class
//////////////////////

class Lv_paths {
    constructor(vis) {
        this.vis = vis;

        this.guides = new Guides();

        let bullets_group = this.guides.make_bullets(this.vis);
        this.draw_lv_paths(bullets_group)
        let color_index = new Color_index(bullets_group);
        color_index.make(motion_colors)
        let graph = new Segments_graph(bullets_group);

        // console.log("DATA: "+JSON.stringify(lv_wm_paths));

    }

    draw_lv_paths(bullets_group) {

        let get_color = (a_motion) => {
            let stroke = ""
            motion_colors.forEach(function (k, v) {
                if (k.mvalue == a_motion) {
                    stroke = k.color
                };
            })

            return stroke;
        }; //get_color


        let get_color_value = (a_motion) => {
            let color_value = ""
            motion_colors.forEach(function (k, v) {
                if (k.mvalue == a_motion) {
                    color_value = k.value
                };
            })

            return color_value;
        }

        let vessel_group = bullets_group.append('g')
            .selectAll('g')
            .attr('id', "lv_group")
            .data(lv_wm_paths);


        let group_enter = vessel_group
            .enter()
            .append('g')
            .attr('id', 'native_group_enter');

        let path_line_mid = d3.line()
            .x(function (d) {
                return d.x;
            })
            .y(function (d) {
                return d.y;
            })
            .curve(d3.curveCatmullRom.alpha(1));

        //fill_color = d3.scale.quantile()
        //          .domain([d3.min(d, (d) -> return d['motion']; ), d3.max(d, (d) -> return d['motion']; )])
        //          .range(motion_colors)

        let paths = group_enter.append("path")
            .attr("id", d => this.dom + "_" + d.id)
            .attr("class", (d, i) => "native")
            .attr("d", d => {
                return d.path
            })
            .attr("stroke-width", d => {
                let size = d.size * 2
                return size;

            })
            .style("stroke", d => {
                let stroke = get_color(d.motion)
                return stroke


            })
            //.style("stroke","url(#vessel_gradient)")
            .style("fill", "none")
            .style("stroke-linecap", "round")
            .style("stroke-join", "round")
            .attr("opacity", d => 0.9);

        const title = group_enter.append('title');
        title.text(d => ` LV Segment: ${d.label + " Motion: " + get_color_value(d.motion)
                 + " Score: " + d.motion }`);



        let over = group_enter.on('mouseover', d => {
            d3.select("#" + this.dom + "_" + d.id)
                .transition()
                .duration(1500)
                .attr("stroke-width", d => {
                    let w = (d.size * 4)
                    return w;

                })
                .style("stroke", "#ddd")
                .attr("cursor", "pointer");
        });




        let out = group_enter.on('mouseout', d => {
            d3.select("#" + this.dom + "_" + d.id)
                .transition()
                .duration(500)
                .attr("stroke-width", d => d.size * 2)
                .style("stroke", d => {
                    let stroke = get_color(d.motion)
                    return stroke
                })
                .attr("cursor", "default");
        });
        //////////////////




    }; //draw_lv_paths
    title(group) {
        const a_title = group.append("title")
            .style("font", "sans-serif")
            .style("font-size", "1.2em")
            .style("text-align", "center")
            .style("background-color", "gray");

        return a_title;
    }

    //////////////////
}; //class
///////////////////
export class DrawLv {
    constructor() {
        this.make_button();

    }; //constructor
    make_button() {
        var button = document.createElement("button");
        button.innerHTML = "Show LV Wall Motion";
        button.classList.add("is-small");
        button.classList.add("is-primary");
        button.classList.add("button");

        var draw_div = document.querySelector('#d3_lv_button');
        if (draw_div !== null) {
            draw_div.appendChild(button);
            button.addEventListener("click", function () {
                let prepare = new Prepare_data();

                let main_svg = d3.select("#main_svg")
                if (main_svg !== null) {
                    d3.select("#main_svg").remove();
                }

                let setup = new SetLv();
                let vis = setup.vis();

                let paths = new Lv_paths(vis);


            });
        }; //if
    };

    /////////////////////
}; //class DrawLv




const init = () => {
    const main = new DrawLv();
};

init();
////////////////////////
//Is drawing as simple Left Ventrcle
//with wall Segments. The colors of them are
//according to the Wall Motion Score 1..5
//
////////////////////////