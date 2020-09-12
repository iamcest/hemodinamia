/*
  See and the cardio_notes for explanation

*/

var d3 = require("d3");


const p = Math.PI * 2;
const step = p / 12;
const start_translate = 'translate(-70px,-50px)';
const end_translate = 'translate(0px,0px)';


const translate_interpolator = d3.interpolateString(start_translate, end_translate);

import {
    lv_segments_data,
    lv_segments_data_aha
} from './cor_data';


export class LvSegModel {

    constructor(d3) {
        this.d3 = d3;
    };
    //////////////

    make_rings(bullets_group) {
        this.bullets_group = bullets_group;
        let margin = {
            top: 30,
            right: 20,
            bottom: 30,
            left: 50
        };

        let rect_w = 350 - margin.left - margin.right;

        let rect_h = 500 - margin.top - margin.bottom;

        let origin_x = 730;
        let origin_y = 650;

        //let origin_y = 900;
        let rect_x = 140;
        let rect_y = 180;
        //let rect_w = 270;
        //let rect_h = 315;


        let canvas = this.bullets_group.append("svg")
            .attr("class", "lv_seg_svg");

        let group = canvas.append("g")
            .attr("transform", `translate(${origin_x}, ${origin_y})`);

        let frame_group = group.append('g');

        let frame_rect = frame_group.append('rect')
            .attr("id", "frame_element")
            .attr("x", -(`${rect_x}`))
            .attr("y", -(`${rect_y}`))
            .attr("rx", 12.5)
            .attr("ry", 12.5)
            .attr("width", `${rect_w}`)
            .attr("height", `${rect_h}`)
            .attr("stroke-width", 4.5)
            .style("stroke", "url(#frame_gradient)");


        let segm_model_text = frame_group.append('text')
            .attr("dx", 0)
            .attr("dy", -150)
            .attr("fill", "#eee")
            .attr("text-anchor", "middle")
            .style("font-family", "sans, georgia, times")
            .style("font-size", "0.9em")
            .style("font-weight", "normal")
            .style("stroke", "none")
            .text("17 - Segmentation Model");

        let s_a = 145;
        let s_b = 137;
        //['#d7191c','#fdae61','#abdda4','#2b83ba']
        let s_model_primary = this.make_bottom_text(frame_group, 0, s_a, "Primary Territory");
        let s_primary_rect = this.make_bottom_rect(frame_group, 5, s_b, "#d7191c",
        "The  Flow is Commonly Supp From  Cor Vessels");

        let s_model_secondary = this.make_bottom_text(frame_group, 0, s_a + 20, "Secondary Territory");

        let s_secondary_rect = this.make_bottom_rect(frame_group, 5, s_b + 20, "#fdae61", "The Flow It may be Supplied From Cor Vessels")

        let s_model_tertiary = this.make_bottom_text(frame_group, 0, s_a + 40, "Tertiary  Territory");
        let s_tertiary_rect = this.make_bottom_rect(frame_group, 5, s_b + 40, "#abdda4",
"The Flow is NOT Supplied From Cor Vessels"
        );

        let remove_text = this.make_bottom_text(frame_group, 0, s_a + 70, "Close");
        //let remove_rect = this.make_bottom_rect(frame_group, 5 ,s_b + 60, "#4dac26");

        let remove_rect = frame_group.append('rect')
            .attr("x", 5)
            .attr("y", s_a + 60)
            .attr("rx", 1.5)
            .attr("ry", 1.5)
            .attr("width", 40)
            .attr("height", 16)
            .attr("stroke-width", 0.6)
            .attr("class", "remove_rect")
            .style("stroke", "#fee08b")
            .style("fill", "#a6d96a");



        let mouse_over = remove_rect.on('mouseover', (d) => {
            let selected = this.d3.selectAll(".remove_rect");
            selected.style("fill", "#fee08b")
                .style("cursor", "pointer")
                .attr("width", 80);
        });

        let mouse_out = remove_rect.on('mouseout', (d) => {
            let selected = this.d3.selectAll(".remove_rect");
            selected.style("fill", "#a6d96a")
                .style("cursor", "default")
                .attr("width", 40);
        });

        let mouse_click = remove_rect.on('click', (d, i) => {
            this.remove_lv_seg_group();
        });


        ///////////////////////
        let arc = this.d3.arc()
            .innerRadius(function (d) {
                return d.inner_radius;
            })
            .outerRadius(function (d) {
                return d.outer_radius;
            })
            .startAngle(function (d) {
                return d.startAngle;
            })
            .endAngle(function (d) {
                return d.endAngle;
            });

        let arcs = group.selectAll(".arc")
            //.data(lv_segments_data)
            .data(lv_segments_data_aha)
            .enter()
            .append("g")
            .attr("class", "arc")
            .attr("id", d => {
                return "arc_" + d.id
            });




        let all_arcs = arcs.append("path")
       .attr("d", arc)
       .attr("id", (d) => {
                return "arc_path_" + d.id
            })

        .attr("class",  (d) => {
                return
                  d.id
            })
            .attr("stroke", "gray")
            .attr("stroke-width", 1.5);

        let mouse_over_path = all_arcs.on('mouseover', (d) => {
            let selected = this.d3.selectAll("#"+"arc_path_" + d.id);
            selected
             .style("cursor", "pointer")
             .append("title")
                .text(" Segment ID: "
                    + d.id
                    + " Name: "
                    + d.name
                    + " Volume:  "
                    + d.volume)
        });

        let mouse_click_path = all_arcs.on('click', (d) => {
        let selected = this.d3.selectAll("#"+"arc_path_" + d.id);
            selected
            .transition()
            .duration(5500)
            //.ease("elastic")
            .attr("stroke-width", (d) =>  { return 1.5 } )
            .style("stroke", "gray")
            .styleTween("transform", (d) => { return translate_interpolator})
            .each("end", (d) => { return
                d3.select(this)
            })
            .transition()
            .delay(1000)
            .duration(500)
            .attr("stroke-width", (d) =>  { return 1.5 })
            .attr("transform", (d) => { return "translate("+ -40 + "," + -50 +")" })
});
        let a_title = arcs.append("title")
            .style("font", "sans-serif")
            .style("font-size", "2.5em")
            .style("text-align", "center")
            .style("cursor", "default")
            .style("background-color", "cyan")
            .text(d => " LV Segment: "
                        + d.id
                        + " - "
                        + d.name
                        + " Volume: "
                        + d.volume
            );

        /////////////////
  arcs.append("text")
  .attr("transform", function(d) {
      let _d = arc.centroid(d);
        _d[0] *= 1.0;   //multiply by a constant factor
        _d[1] *= 1.0;   //multiply by a constant factor
        return "translate(" + _d + ")";
            })
       .attr("dx", "1px")
      .attr("dy", "2px")
      .style("text-anchor", "middle")
      .style("font-size", "0.85em")
      .style("font-weight", "normal")
      .style("opacity", "0.75")
       .style("fill", 'none')
       .style("stroke", "#2b83ba")
    .text((d) => {
          return d.id
      });

/***************
let model_segment_text = arcs.append("text")
            .attr("dx", 1 + "px")
            .attr("dy", 5 + "px")
            .attr("text-anchor", "start")
            .style("font-family", "impact, georgia, times, sans")
            .style("font-size", "0.85em")
            .style("font-weight", "normal")
            .style("opacity", "0.75")
            .style("fill", 'none')
            .style("stroke", "#fff")
.text((d, i) => {
    console.log("-d ---> " + JSON.stringify(d.id) + "---i: " + i)
       return d.id
            })
        ///////////////////////
        ****************/
  }; //make_rings

    remove_lv_seg_group() {

        let selected = this.d3.selectAll(".lv_seg_svg");
        selected.remove();
    }
    make_bottom_text(frame_group, dx, dy, text) {
        let segm_model_primary = frame_group.append('text')
            .attr("dx", dx)
            .attr("dy", dy)
            .attr("fill", "#eee")
            .attr("text-anchor", "end")
            .style("font-family", "sans, georgia, times")
            .style("font-size", "0.7em")
            .style("font-weight", "normal")
            .style("stroke", "none")
            .text(text);
    }; //make_bootom_text

    make_bottom_rect(frame_group, x, y, color, title) {
        let primary_rect = frame_group.append('rect')
            .attr("x", x)
            .attr("y", y)
            .attr("rx", 1.5)
            .attr("ry", 1.5)
            .attr("width", 80)
            .attr("height", 13)
            .attr("stroke-width", 0.1)
            .style("stroke", "gray")
            .style("fill", color)
            .attr("cursor", "pointer")
            .append("title")
            .style("font", "sans-serif")
            .style("font-size", "2.5em")
            .style("text-align", "center")
            .style("cursor", "default")
            .style("background-color", "cyan")
            .text(title)



        return primary_rect;

    }; //make_bottom_rect

}; //class
