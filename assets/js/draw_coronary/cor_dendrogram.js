var d3 = require('d3');

var subGraph = require('graphology-utils/subgraph');

import {
    Cor_tree_graph,
    Cor_tree_grafts
} from './coronary_graph.js';

const get_graph = () => {
    return Cor_tree_graph;
};

const get_gg_graph = () => {
    return Cor_tree_grafts;
};
const graft_edges = new Array();

const get_draw_n_template = () => {
    return draw_n_template[0];
};


export class Cor_dendrogram {
    constructor(bullets_group, data2draw, graft2draw) {
        this.g = new Cor_tree_graph();


        this.group = bullets_group;

        this.data2draw = data2draw;

        this.graft2draw = graft2draw;


        this.graph = this.g.set_graph();

        /*
         * this.graph.forEachEdge(
  (edge, attributes, source, target, sourceAttributes, targetAttributes) => {
    console.log(`Edge from ${source} to ${target}`);
});
*/

        //let all_nodes= this.graph.nodes()
        // console.log('all_nodes ' + JSON.stringify(all_nodes));

        this.graph_updated = this.update_graph(this.graph)

        this.rca_data = this.rca_sub_graph(this.graph_updated);
        this.rca_color = "#7fc97f"
        this.draw_dendrogram(this.group, this.rca_color, this.rca_data)

        this.left_data = this.left_sub_graph(this.graph_updated);
        this.left_color = '#fdc086'
        this.draw_dendrogram(this.group, this.left_color, this.left_data)


        /*
        this.gg_graph_updated = this.update_gg_graph(this.gg_graph)
        this.graft_edges = this.build_graft_edges(this.gg_graph_updated)
        this.graft_data = this.graft_graph(this.gg_graph_updated);
        this.graft_color = "yellow"
        this.draw_dendrogram(this.group, this.graft_color,
            this.graft_data)
            */


    } //constructor
    ///////////
    /*
     *
     In Main program  the data in cor_data.js
     Have been transformed. Calculations are added,  lesion_sten_pct as are comming
     from Database. These data are kept serapated in draw_n_template
     (Actual Array To Draw )

     Now we injecting these data to graph
     */

    update_gg_graph(graph) {

        for (let i = 0; i < this.graft2draw.length; i++) {
            let data_i = this.graft2draw[i];
            let data_i_id = data_i["cath_graft_prox_site"]

            for (let prop in data_i) {
                //const new_node = graph.addNode(data_i['cath_graft_segments_cdisc'])
                if (prop !== "") {

                    graph.setNodeAttribute(data_i_id,
                        prop,
                        data_i[prop]);
                }
            }; //for prop

        }; //for i
        //  console.log("final graft graph -->" +  JSON.stringify(graph) )

        return graph;


        /////////////////////

    }; //update_gg_graph

    /***************************************/

    update_graph(graph) {
        for (let i = 0; i < this.data2draw.length; i++) {
            let data_i = this.data2draw[i];
            let data_i_id = data_i["id"]

            for (let prop in data_i) {
                //if(prop !== ""){
                if (typeof prop !== 'undefined' && prop) {

                    graph.setNodeAttribute(data_i_id,
                        prop,
                        data_i[prop]);
                }
            }; //for prop

            //graph.setNodeAttribute(data_i_id, 'cor_les_pct', data_i['cor_les_pct']);
        }; //for i
        return graph;

        //////////
    }; //update_graph
    /***********************************8*/

    rca_sub_graph(graph_updated) {
        //  console.log("-=====rca graph_updated===========->"+  JSON.stringify(graph_updated));


        let rca_treeData = [];

        let rca_data = new Array();

        let sub_result = subGraph(graph_updated, [
            'start',
            'rca_ostium_shepherd_crook',
            'rca_ostium',
            'rca_conus',
            'rca_prox',
            'lad_distal_type_ii_origin_rca_prox',
            'rca_mid',
            'rca_v_branch_small',
            'rca_acute_marginal',
            'rca_distal',
            'rca_pda',
            'rca_pda_large',
            'rca_pda_small',
            'rca_pla',
            'rca_pl1',
            'rca_pl2',
            'rca_pl3',
        ]);

        let data_a = sub_result.forEachEdge(
            (
                edge,
                attributes,
                source,
                target,
                sourceAttributes,
                targetAttributes,
            ) => {

                let data_i = {
                    name: target,
                    parent: source,
                    attributes: targetAttributes
                };

                rca_data.push(data_i);
            },
        );

        let dataMap = rca_data.reduce(function (map, node) {
            map[node.name] = node;
            return map;
        }, {});


        rca_data.forEach(function (node) {
            // add to parent
            let parent = dataMap[node.parent];
            if (parent) {
                // create child array if it doesn't exist
                parent.children || (parent.children = []);
                // add node to child array
                parent.children.push(node);
            } else {
                // parent is null or missing
                rca_treeData.push(node);
            }
        });

        return rca_treeData[0]

    }; //rca_sub_graph
    /*************************************************/
    left_sub_graph(graph_updated) {
        let left_treeData = [];
        let left_data = new Array();

        let sub_result = subGraph(graph_updated, [
            'start',
            'lm_ostium',
            'lm_body',
            'lm_bifurcation',
            'lm_ostium_rcs_course_pa_ao',
            'ramus',
            'ramus_branch',
            'lad_ostium',
            'lad_prox',
            'lad_mid',
            'lad_distal',
            'lad_distal_type_i',
            'lad_distal_type_iii_mid_inf',
            'lad_distal_type_iii_pda',
            'lad_distal_type_ii_origin_rca_prox',
            'lad_distal_type_ii',

            'lad_d1',
            'lad_d1_branch',
            'lad_d2',
            'lad_d2_branch',
            'lad_d3',
            'lad_d3_branch',
            'lad_septal',
            'lad_septal_2',
            'lad_septal_3',
            'lcx_ostium',
            'lcx_ostium_rcs',
            'lcx_prox',
            'lcx_om1',
            'lcx_om1_branch',
            'lcx_om2',
            'lcx_om2_branch',
            'lcx_om3',
            'lcx_om3_branch',
            'lcx_mid',
            'lcx_distal',
            'lcx_pla',
            'lcx_pl1',
            'lcx_pl2',
            'lcx_pl3',
            'lcx_pda'

        ]);

        let data_a = sub_result.forEachEdge(
            (
                edge,
                attributes,
                source,
                target,
                sourceAttributes,
                targetAttributes,
            ) => {
                let data_i = {
                    name: target,
                    parent: source,
                    attributes: targetAttributes
                };

                left_data.push(data_i);
            },
        );

        let dataMap = left_data.reduce(function (map, node) {
            map[node.name] = node;
            return map;
        }, {});


        left_data.forEach(function (node) {
            // add to parent
            let parent = dataMap[node.parent];
            if (parent) {
                // create child array if it doesn't exist
                parent.children || (parent.children = []);
                // add node to child array
                parent.children.push(node);
            } else {
                // parent is null or missing
                left_treeData.push(node);
            }
        });

        return left_treeData[0]

    }; //left_sub_graph

    /*************************************/
    graft_graph(graph) {
        let graft_treeData = [];
        let graft_data = new Array();

        let data_a = graph.forEachEdge(
            (
                edge,
                attributes,
                source,
                target,
                sourceAttributes,
                targetAttributes,
            ) => {
                let data_i = {
                    name: target,
                    parent: source,
                    attributes: targetAttributes
                };

                graft_data.push(data_i);
            },
        );
        let dataMap = graft_data.reduce(function (map, node) {
            map[node.name] = node;
            return map;
        }, {});


        graft_data.forEach(function (node) {
            // add to parent
            let parent = dataMap[node.parent];
            if (parent) {
                // create child array if it doesn't exist
                parent.children || (parent.children = []);
                // add node to child array
                parent.children.push(node);
            } else {
                // parent is null or missing
                graft_treeData.push(node);
            }
        });

        return graft_treeData[0]

        //console.log("graft_data" +  JSON.stringify(graft_data) )
        ////////////
    }; //graft_graph
    /**************************/

    /*************************************/
    build_graft_edges(graph) {
        graph.forEachNode((node, attributes) => {
            let source = attributes["cath_graft_prox_site"]
            // console.log("ATTRIBUTS:"  + JSON.stringify(attributes) )
            let target = attributes['cath_graft_segments_cdisc'];
            if (typeof target !== 'undefined' && target) {
                const new_node = graph.mergedNode(target);
                let key = source + "_" + target;
                if (target !== "") {
                    let edge = graph.addEdgeWithKey(key, source, target);
                }
            }
        });

        graph.forEachEdge(
            (edge, attributes, source, target, sourceAttributes, targetAttributes) => {
                console.log(`Edge from ${source} to ${target}`);
            });

        return graph;

    }; //build_graft_edges

    /**************************/


    draw_dendrogram(group, color, treeData) {
        let margin = {
            top: 30,
            right: 20,
            bottom: 30,
            left: 50,
        };

        let rect_w = 380 - margin.left - margin.right;
        let rect_h = 530 - margin.top - margin.bottom;
        let rect_x = 140;
        let rect_y = 180;
        let tree_w = 1000 - margin.left - margin.right;
        let tree_h = 1000 - margin.top - margin.bottom;

        let tree_origin_x = tree_w * 0.32;
        let tree_origin_y = tree_h * 0.5;
        let half_x = -(tree_w * 0.4);
        let half_y = -(tree_h * 0.5);
        let rotate = 0;

        let frame_group = group
            .append('g')
            .attr('transform', `translate(${tree_origin_x},
          ${tree_origin_y})`);


        let treemap = d3.tree().size([tree_w, tree_h]);
        let nodes = d3.hierarchy(treeData);

        nodes = treemap(nodes);



        let remove_rect = frame_group
            .append('g')
            .append('rect')
            .attr("x", `${half_x}`)
            .attr("y", `${half_y}`)
            .attr("rx", 1.5)
            .attr("ry", 1.5)
            .attr("width", 100)
            .attr("height", 30)
            .attr("stroke-width", 0.6)
            .attr("id", "remove_rect_g")
            .style("stroke", "#fff")
            .style("fill", "#2ba6cb")
            .attr('cursor', 'pointer')
            .append('title')
            .text((d) => {
                return ' Close Tree Map Of Cor Segments';
            })



        let remove_rect_text = frame_group.append('text')
            .attr("x", `${half_x+3}`)
            .attr("y", `${half_y+16}`)
            .attr("fill", "#000")
            .attr("text-anchor", "start")
            .style("font-family", "sans, georgia, times")
            .style("font-size", "0.85em")
            .style("font-weight", "bold")
            .style("stroke", "none")
            .text("Close Tree ");


        let mouse_over_rect = frame_group.on('mouseover', (d) => {
            let selected = d3.selectAll("#remove_rect_g");
            d3.event.preventDefault();
            selected
                .style("cursor", "pointer")
                .style("fill", "cyan")
                .attr("width", "140px")
                .attr("height", "35px")

        });

        let mouse_out = frame_group.on('mouseout', (d) => {
            let selected = d3.selectAll('#remove_rect_g')
            d3.event.preventDefault();

            selected.style("fill", "#2ba6cb")
                .style("cursor", "default")
                .attr("width", 100)
                .attr("height", 30)


        });

        let mouse_click = frame_group.on('click', (d, i) => {
            let selected = d3.selectAll(".tree_map_g");
            selected.remove();
        });

        let tree_group = group.append('g')
            .attr('transform', `translate(${tree_origin_x},
          ${tree_origin_y})`);

        let g = tree_group
            .append('g')
            .attr("class", "tree_map_g")
            .attr('transform', `translate(${half_x}, ${half_y})`);



        // adds the links between the nodes
        let link = g
            .selectAll('.link')
            .data(nodes.descendants().slice(1))
            .enter()
            .append('path')
            .attr('class', (d) => {
                return 'link' + d.data.name
            })
            .attr('d', function (d) {
                return (
                    'M' +
                    d.x +
                    ',' +
                    d.y +
                    'C' +
                    d.x +
                    ',' +
                    (d.y + d.parent.y) / 2 +
                    ' ' +
                    d.parent.x +
                    ',' +
                    (d.y + d.parent.y) / 2 +
                    ' ' +
                    d.parent.x +
                    ',' +
                    d.parent.y
                );
            })
            .style('fill', 'none')
            .style('stroke', color)
            .attr('opacity', 0.9)
            .style('stroke-width', '3px')





        /*
         *
         *var totalLength = path.node().getTotalLength();

    // Set Properties of Dash Array and Dash Offset and initiate Transition
    path
        .attr("stroke-dasharray", totalLength + " " + totalLength)
        .attr("stroke-dashoffset", totalLength)
    .transition() // Call Transition Method
        .duration(4000) // Set Duration timing (ms)
        .ease(d3.easeLinear) // Set Easing option
        .attr("stroke-dashoffset", 0); // Set final value of dash-offset for transition
});
            * */

        let mouse_over_link = link.on('mouseover', (d) => {
            let selected = d3.selectAll(".link" + d.data.name);
            selected
                .style("cursor", "pointer")
                .style("stroke", "#fff")
                .attr("stroke-width", "40px")
                .append('title')
                .text((d) => {
                    return ' Link From : ' + d.data.parent
                })

        });


        let mouse_out_link = link.on('mouseout', (d) => {

            let selected = d3.selectAll(".link" + d.data.name);
            selected
                .style("cursor", "default")
                .style("stroke", color)
                .attr("stroke-width", "3px")



        });


        // adds each node as a group

        let node = g
            .selectAll('.node')
            .data(nodes.descendants())
            .enter()
            .append('g')
            .attr("id", (d, i) => {
                return "node" + d.data.name
            })
            .attr('class', function (d) {
                return 'node' + (d.children ? ' node--internal' : ' node--leaf');
            })
            .attr('cursor', 'pointer')
            .attr('transform', function (d) {
                return 'translate(' + d.x + ',' + d.y + ')';
            });

        /*
  let marker = new Marker()
     let marker_group = node.append('g')
     .attr('id','lesion_marker')
      marker.make(marker_group)
      */
        let arc = this.make_arc(10)

        let all_arcs = node.append("path")
            .attr("d", arc)
            .style("stoke-width", 5)
            .style("stoke", (d) => {
                return "red"

            })
            .style("fill", (d) => {
                let is_variant = d.data.attributes.is_variant;
                let les_pct = d.data.attributes.cor_les_pct
                let les_pct_num = parseInt(les_pct)
                if (les_pct_num >= 30) {
                    //return "url(#lesion_gradient)"
                    return "yellow"
                }

                if (is_variant == 'Y') {
                    return "url(#variant_gradient)"
                } else {
                    return "url(#node_gradient_2)"
                }
            })

            .style('opacity', 0.9)

        let node_title = node.append('title')
            .attr('cursor', 'pointer')
            .text((d) => {
                return ' Segment: ' +
                    d.data.name;
            });

        // adds the circle to the node

        /*
let node_circle = node.append('circle')
            .attr("id", (d) => {return "node" + d.data.name})
        .attr('r', (d) => {
           let les_pct = d.data.attributes.cor_les_pct
           let les_pct_num = parseInt(les_pct)
           if (les_pct_num > 30 && les_pct !== "") {
                return 15;
                } else {
                    return 10;
                }
            })
            .style('stroke', (d) => {
                 let is_variant = d.data.attributes.is_variant;
switch (is_variant) {
  case "Y":
            return "yellow"
   break;

 case "N":
         return color;
   break;


    case "":
         return color;
   break;


   default:
   return console.log("Somthing Wrong");

}
            })
            .style("fill", (d) => {
                let les_pct = d.data.attributes.cor_les_pct
                let is_variant = d.data.attributes.is_variant;
                let les_pct_num = parseInt(les_pct)

 switch (les_pct_num) {
    case les_pct_num:
        if (les_pct_num > 30 && les_pct !== "") {
                    return "url(#symbol_gradient)";
                } else {
                    return 'url(#node_gradient_2)';
                }

   break;

    default:
         console.log("Wrong ")

 }

 switch (is_variant) {
    case "Y":
            return "url(#variant_gradient)"
   break;

  case "N":
         return "url(#node_gradient_2)";
   break;

     default:
        return "url(#node_gradient_2)";

}
            })
            .style('stroke-width', '4px')
            .attr('opacity', 0.7)
            */
        // adds the text to the node
        node
            .append('text')
            // .attr('dy', '0.9em')
            .attr("dx", '1em')
            .attr('y', function (d) {
                return d.children ? -20 : 20;
            })
            .style('text-anchor', 'start')
            .text(function (d) {
                return d.data.name;
            })
            .style('font-size', '0.85em')
            .style('fill', color)
            .attr("transform", "rotate(-45)");



        /////////
    } //update_tree


    rotate_digits() {
        d3.select(this).transition()
            .duration(1000)
            .attrTween('transform', (d) => {
                d3.interpolateString('rotate(0 40 50)', 'rotate(360 40 50)')
            })

    }

    make_arc(lineWidth) {
        return d3
            .arc()
            .innerRadius(0.2 * lineWidth)
            .outerRadius(1.25 * lineWidth)
            .startAngle(0)
            .endAngle(2 * Math.PI);
    }


    //.on("click", click);
    /*
let click = (d) => {
  if (d.children) {
    d._children = d.children;
    d.children = null;
  } else {
    d.children = d._children;
    d._children = null;
  }
  update(d);
}
*/

    /*************************************************/


} //class Cor_dendrogram
//////////
class Marker {
    make(group) {

        let marker_def = group.append('defs');
        /*
marker_def
.append('marker')
.attr("id", "Triangle")
.attr("refX", 12)
.attr("refY", 6)
.attr("markerUnits", 'userSpaceOnUse')
.attr("markerWidth", 120)
.attr("markerHeight", 180)
.attr("orient", 'auto')
.append('path')
.attr("d", 'M 0 0 12 6 0 12 3 6');
*/

        marker_def
            .append('svg:marker')
            .attr('id', 'marker_arrow')
            .attr('viewBox', '-6 -6 12 12')
            .attr('refX', 0)
            .attr('refY', 0)
            .attr('markerWidth', 3)
            .attr('markerHeight', 5)
            .attr('markerUnits', 'strokeWidth')
            .attr('orient', 'auto')
            .append('polygon')
            .attr('points', '-4,4 -10,10 10,2 -10,-10')
            .style('fill', 'red')
            .style('stroke', 'yellow')
            .style('stroke-width', 4)
            .style('opacity', 0.7);

        group
            .append('polyline')
            //.attr('points', '0,0 50,-10 200,-10')
            .attr('points', '100,-10,50,-10,0,0')
            .attr('stroke-width', 2.0)
            .attr('stroke', '#fff')
            .attr('fill', 'none')
            .attr('marker-end', 'url(#marker_arrow)')
            .attr('marker-start', 'url(#marker_arrow)');

        /*
            let circle_xy = utility.make_circle_xy(290, 16);
            //.attr("x", circle_xy.x )
            // .attr("y", circle_xy.y)
            group
              .append('circle')
              .attr('cx', circle_xy.x)
              .attr('cy', circle_xy.y)
              .attr('r', 10)
              .attr('fill', 'url(#frame_gradient)')
              .attr('stroke', 'url(#stent_gradien)')
              .attr('opacity', 0.7);
              */
        /*
                      group.append("circle")
                      .attr('cx', 100)
                      .attr('cy', -10)
                      .attr("r", 10)
                      .attr('fill', 'url(#frame_gradient)')
                      .attr('stroke', 'url(#stent_gradien)')
                      .attr("opacity", 0.7)
                    */
    } //make
} //clas Marker