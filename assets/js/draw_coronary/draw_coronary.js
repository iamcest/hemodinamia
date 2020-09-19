var d3 = require('d3');
var convert = require('xml-js');

const mag_size = 1.9;
//var dag = d3.sugiyama();


const Graph = require('graphology/build/graphology.js');

const {
  pathDataToPolys,
} = require('svg-path-to-polygons/svg-path-to-polygons.js');
//let pathData = 'M5,15 c5.5,0 10-4.5 10,-10 h10';
//let points = pathDataToPolys(pathData, {tolerance:1, decimals:1});
/*
  console.log(`M ${x} ${y}`);

  #Sequencial Pallets 3-9
  #Blues: BuGn BuPu GnBu Greens Greys
  #Purples RdPu Redss
  #Greys:
  #Oranges: OrRd PuBu PuBuGn PuRd Purples RdPu
  #Reds: YlGn YlGnBu YlOrBr YlOrRd

  brewer_blue: colorbrewer.RdYlBu[11].reverse()
  brewer_greys: colorbrewer.Greys[6]
  brewer_pastel_1: colorbrewer.Pastel1[9]
  brewer_oranges: colorbrewer.Oranges[6]
  brewer_purples: colorbrewer.RdPu[6]
  vein_colors : colorbrewer.RdYlBu[6]
  vein_colors : colorbrewer.YlOrBr[6]
d3.html("resources/icon_1907.svg", function(data) {console.log(data);});

d3.html("resources/icon_1907.svg", loadSVG);

function loadSVG(svgData) {
 while(!d3.select(svgData).selectAll("path").empty()) {

d3.select("svg").node().appendChild(
     d3.select(svgData).select("path").node());
  }

d3.selectAll("path").attr("transform", "translate(50,50)");

  * */
/*
The
nodes represent arterial segments and are attributed with
the position, mean diameter and orientation of the arterial
segment; the arcs define the descent of the segments up to
the second order, i.e., parent-child relationships and
grandparent-child relationships.

*/
import {
  Background_grid
} from './background_grid.js';
import {
  connectedComponents
} from 'graphology-components/index.js';
var subGraph = require('graphology-utils/subgraph');

import shortestPath from 'graphology-shortest-path/index.js';
import {
  dijkstra
} from 'graphology-shortest-path';
import {
  colorbrewer
} from './colorbrewer.js';
//import {dagStratify} from 'd3-dag/dist/d3-dag.min.js';

let brewer_red = colorbrewer.Reds[3];
let vein_colors = colorbrewer.YlOrBr[6];
/*
d3.html("http://localhost:4000/images/cdisc.svg", loadSVG);
let loadSVG = (svgData) => {
while(!d3.select(svgData).selectAll("path").empty()) {
    d3.select(svgData).selectAll("path").each(function() {
        d3.select("svg").node().appendChild(this);
    });
    d3.selectAll("path").attr("transform", "translate(50,50)");
}};
*/

let diverge_color = [
  'blue',
  'cyan',
  'pink',
  'yellow',
  'green',
  'white',
  'black',
  'white',
  'grey',
  'white',
  'darkorchid',
  'darkred',
];

const start_translate = 'translate(100px,-35px)';
const end_translate = 'translate(0px,0px)';

import {
  Cor_tree_graph,
  Cor_tree_grafts
} from './coronary_graph.js';

const get_graph = () => {
  return Cor_tree_graph;
};

import {
  Gradients
} from './gradients.js';

import {
  toPoints
} from 'svg-points/dist/svg-points.js';

import {
  textures
} from './textures.js';

import {
  symbols
} from './symbols.js';



import {
  natives_template,
  vessel_lv_territories_aha,
  segment_colors_aha,
  lv_segments_data_aha,
  cor_tree_data,
} from './cor_data.js';

const get_cor_tree_data = () => {
  return cor_tree_data;
};

const get_segment_colors_aha = () => {
  return segment_colors_aha;
};
const get_segments_data_aha = () => {
  return lv_segments_data_aha;
};

import {
  Segment_property
} from './segment_property.js';

let db_lesions_data = new Array();

//////////
import {
  Grafts_template,
  T_grafts_template
} from './grafts_template.js';

import {
  LvSegModel
} from './lv_seg_model';
import {
  Cor_dendrogram
} from './cor_dendrogram';

/* **** The data from Database****/
const get_db_data = () => {
  if (typeof (INFO_CORONARY_DATA) !== 'undefined') {
    return INFO_CORONARY_DATA;
  }

};

const get_db_lesions_data = () => {
  let db_data = get_db_data();
  let lesions_data = db_data['info_coronary']['corLesions'];

  return lesions_data;
};
const get_db_grafts_data = () => {
  let db_data = get_db_data();
  let grafts_db_data = db_data['info_coronary']['cathGrafts'];
  return grafts_db_data;
}; //get_db_grafts_data

/*************************/
const get_db_collaterals_data = () => {
  let db_data = get_db_data();
  let collat_db_data = db_data['info_coronary']['corCollaterals'];
  return collat_db_data;
}; //get_db_grafts_data


const get_db_anatomy_data = () => {
  let db_data = get_db_data();
  let anatomy_db_data = db_data['info_coronary']['corAnatomies'];
  if (anatomy_db_data == null) {
    alert("Please Add Some Data in Anatomy Record. Sketch Is Not Going to be drawn");
  }
  return anatomy_db_data[0];

}; //get_db_anqatomy_data

const get_db_dominance = () => {
  let utility = new Utility();
  let db_data = get_db_anatomy_data();

  let dominance = ""
  if (typeof db_data !== 'undefined' && db_data) {
    dominance = db_data['cor_anat_dominance'];
    return dominance;
  } else {
    dominance = 'rca';
    alert("Please Complete File: Angio Menu -> Anatomy. Presenting Defaults ")
    utility.message("Please Define at least the Coronary Dominance");
    return dominance;
  }
};
/* *** Store Native Coronaries segments  to draw  *** */




/*
class Graph_draw_n_template{
      constructor(){
        this.g_draw_natives_template  = new Graph({
          multi: false,
          directed: true,
          allowSelfLoops: false,

      })


      }
       //////////////////////////////
       add_node(node, attributes){
        this.g_draw_natives_template.addNode(node, attributes);

       }

       get_all_nodes(){
        let all_nodes = this.g_draw_natives_template.nodes();
        return all_nodes;
     }

     setNodeAttribute(a_node, an_attribute, a_value){
          this.g_draw_natives_template.setNodeAttribute(a_node, an_attribute, a_value);
      }

      set_attributes(a_node, attributes){
        this.g_draw_natives_template.replaceNodeAttributes(a_node, attributes);
      }
      get_all_attributes(){
        let all_attributes= this.g_draw_natives_template.getAttributes()
        //console.log("OREDR_OF_GRAPH: "+ this.g_draw_natives_template.order)
       // console.log( this.g_draw_natives_template.size)
        return all_attributes;

      }

      getNodeAttributes(a_node){
      let attr  = this.g_draw_natives_template.getNodeAttributes(a_node);
         return attr;

     }
      ////////////////
      getNodeAttribute(a_node, an_attribute){
        let attr  = this.g_draw_natives_template.getNodeAttribute(a_node, an_attribute);
        //graph.getNodeAttributes(node);
        return attr;
      };//get_attribute



      export(){
          let graph_export = this.g_draw_natives_template.export()
          return graph_export;
        }


      //////////////////////////
      hasNodeAttribute(a_node, an_attr){
        let attr = this.g_draw_natives_template.hasNodeAttribute(a_node, an_attr);
        return attr;
      }
      ////////////////////////
      get_1(){
        let all_attributes= this.g_draw_natives_template.getAttributes()
        return all_attributes;

      }
      ///////////////////////////
    for_each_node(){
      let prep_natives_data = new Prepare_natives_data();

      this.g_draw_natives_template.forEachNode((node, attributes) => {
       prep_natives_data.insert_graph_x_y(node)

      });

    };//for_each_node
    ///////////////////


      ///////////////////
      };//class Graph_draw_n_template
*/

////////////////////////////

//let g_draw_n_template = new Graph_draw_n_template();


let g_draw_n_template = new Graph({
  directed: true
})


/* *** Templates For Native Coronaries *** */
let draw_n_template = new Array();

/* get_n_template: Gets the Template ( From cor_data.js)
 * for native coronaries
 */
///////////////
const get_n_template = () => {
  return natives_template;
};

/* get_draw_n_template: Get the tamplate that we have builded
 * */
const get_draw_n_template = () => {

  return draw_n_template[0];
};
/*************************/

/* *** Symbols For Lesion Characteristics *** */
const get_symbols = () => {
  return symbols;
};
let draw_symbols_template = new Array();

let get_draw_symbols_template = () => {
  return draw_symbols_template;
};
/*************************/

/* *** For grafts *** */
let draw_grafts_template = new Array();

let draw_t_grafts_template = new Array();

/***************************
 * The get_grafts_template
 * is geting some prototyping
 * data from grafts_template.js
 **************************/
const get_grafts_template = () => {
  return Grafts_template;
};
/**
 * This is geting the template from
 * grafts_template. Is not for drawing
 *
 */

const get_t_grafts_template = () => {
  return T_grafts_template;
};

/*
 * This is the template to draw
 * the grafts. Is Filled up from some
 * calculations and the data comming from
 * Data Base
 ***********/
const get_draw_grafts_template = () => {
  return draw_grafts_template;
};
/*
 * This is the template to draw
 * the T_grafts. Is Filled up from some
 * calculations and the data comming from
 * Data Base. T grafts are comming off
 * from a Graft and  are lile a T
 ***********/

let get_draw_t_grafts_template = () => {
  return draw_t_grafts_template;
};
/*************************/

let draw_collaterals_template = new Array();

let get_draw_collaterals_template = () => {
  return draw_collaterals_template;
};
class Points2Rect {
  constructor() { }

  make(points) {
    let rect_w = 15;
    let rect_h = 30;

    let rect_x = points[0]['x'];
    let rect_y = points[0]['y']

  }

} //class
class Calc_paths {
  constructor() {
    this.points2rect = new Points2Rect();
  }

  construct_element(segment, div_id, start, end, element) {
    let seg_path = d3.select('path#' + div_id).node();
    let n0 = seg_path.getTotalLength();
  } //construct_element
  /////////////////////
  build_t_graft_points(template, graft, start_path, end_path) {
    let utility = new Utility();
    let p1 = utility.path_to_points(start_path);
    let p2 = utility.path_to_points(end_path);

    let path_all_points = this.create_points_at_distance(p1, p2);
    let ostial_points = path_all_points.slice(0, 3);
    let proximal_points = path_all_points.slice(2, 6);
    let mid_points = path_all_points.slice(5, 10);
    let distal_points = path_all_points.slice(9, 13);
    let distal_anast_points = path_all_points.slice(12, 14);
    // let t_graft_segement_paths = this.graft_segment_paths(graft, path_all_points)

    this.insert_t_graft_xy(
      template,
      graft,
      'ostial_graft_x',
      'ostial_graft_y',
      ostial_points,
    );

    this.insert_t_graft_xy(
      template,
      graft,
      'proximal_graft_x',
      'proximal_graft_y',
      proximal_points,
    );

    this.insert_t_graft_xy(
      template,
      graft,
      'mid_graft_x',
      'mid_graft_y',
      mid_points,
    );

    this.insert_t_graft_xy(
      template,
      graft,
      'distal_graft_x',
      'distal_graft_y',
      distal_points,
    );

    this.insert_t_graft_xy(
      template,
      graft,
      'distal_anast_graft_x',
      'distal_anast_graft_y',
      distal_anast_points,
    );

    return path_all_points;
  }
  //////////////////////////
  insert_t_graft_xy(draw_template, graft, position_x, position_y, points) {
    if (draw_template['cath_graft_prox_site'] == graft) {
      draw_template[position_x] = points[0]['x'];
      draw_template[position_y] = points[0]['y'];
    } //if
  } //insert_graft_xy

  /////////////////
  build_graft_paths(d, graft) {
    let start_div = d['cath_graft_prox_site'] + '_' + 'start';
    let end_div = d['cath_graft_prox_site'] + '_' + 'end';

    let start_path = d3.select('path#' + start_div).node();
    let n1 = start_path.getTotalLength();
    let p1 = start_path.getPointAtLength(n1 * 0.75);

    let end_path = d3.select('path#' + end_div).node();
    let n2 = end_path.getTotalLength();
    let p2 = end_path.getPointAtLength(n2 * 0.6);

    let path_all_points = this.create_points_at_distance(p1, p2);
    // this.points2rect.make(path_all_points);

    let line = d3
      .line()
      .x(d => {
        return d.x;
      })
      .y(d => {
        return d.y;
      })
      //  .curve(d3.curveCatmullRom.alpha(0.3));
      // .curve(d3.curveBundle);
      //            .curve(d3.curveCardinal)
      //              .curve(d3.curveMonotoneY);
      .curve(d3.curveNatural);
    ////Note don not change the Curvatures because the t-grafts  do not  show up

    let graft_segement_paths = this.graft_segment_paths(graft, path_all_points);

    let insert_graft_lesions = this.insert_graft_lesions(graft);

    let graft_path = line(path_all_points);

    return graft_path;
  } //graft_path

  ///////////////

  create_points_at_distance(p1, p2) {
    let distance = Math.sqrt(
      Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2),
    );

    let point_at_05 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.05);
    let point_at_10 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.1);
    let point_at_20 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.2);
    let point_at_30 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.3);
    let point_at_40 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.4);
    let point_at_50 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.5);
    let point_at_60 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.6);
    let point_at_70 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.7);
    let point_at_75 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.75);
    let point_at_80 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.8);
    let point_at_90 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.9);
    let point_at_95 = this.find_points(p1.x, p2.x, p1.y, p2.y, distance * 0.95);
    let path_all_points = [{
      x: p1.x,
      y: p1.y,
    },
    {
      x: point_at_05.x - 4,
      y: point_at_05.y - 2,
    },
    {
      x: point_at_10.x + 8,
      y: point_at_10.y - 2,
    },
    {
      x: point_at_20.x + 12,
      y: point_at_20.y - 1,
    },
    {
      x: point_at_30.x + 10,
      y: point_at_30.y - 2,
    },
    {
      x: point_at_40.x + 5,
      y: point_at_40.y - 2,
    },
    {
      x: point_at_50.x + 4,
      y: point_at_50.y - 1,
    },
    {
      x: point_at_60.x - 3,
      y: point_at_60.y - 1,
    },
    {
      x: point_at_70.x + 4,
      y: point_at_70.y - 1,
    },
    {
      x: point_at_75.x + 0,
      y: point_at_75.y - 2,
    },
    {
      x: point_at_80.x + 0,
      y: point_at_80.y - 1,
    },
    {
      x: point_at_90.x + 2,
      y: point_at_90.y - 1,
    },
    {
      x: point_at_95.x - 3,
      y: point_at_95.y - 1,
    },
    {
      x: p2.x,
      y: p2.y,
    },
    ];

    return path_all_points;
    //return path_all_points_a;
  } //create_points_at_distance
  ///////////////
  find_points(p1_x, p2_x, p1_y, p2_y, at_distance) {
    let angle = Math.atan2(p2_y - p1_y, p2_x - p1_x);

    let sin = Math.sin(angle) * at_distance;
    let cos = Math.cos(angle) * at_distance;

    let p_y = p1_y + sin;
    let p_x = p1_x + cos;

    let a_point = new Array();
    a_point = {
      x: p_x,
      y: p_y,
    };
    return a_point;
  } //find_points
  ////////////////////
  insert_graft_lesions(graft) {
    let db_graft_data = get_db_grafts_data();
    let grafts_template = get_draw_grafts_template();

    for (let i = 0; i < db_graft_data.length; i++) {
      let db_graft_data_i = db_graft_data[i];

      for (let j = 0; j < grafts_template.length; j++) {
        let graft_template_j = grafts_template[j];
        if (
          db_graft_data_i['cath_graft_prox_site'] ==
          graft_template_j['cath_graft_prox_site']
        ) {
          graft_template_j['graft_ostial_sten_pct'] =
            db_graft_data_i['graft_ostial_sten_pct'];

          graft_template_j['graft_prox_sten_pct'] =
            db_graft_data_i['graft_prox_sten_pct'];

          graft_template_j['graft_mid_sten_pct'] =
            db_graft_data_i['graft_mid_sten_pct'];

          graft_template_j['graft_dist_sten_pct'] =
            db_graft_data_i['graft_dist_sten_pct'];

          graft_template_j['graft_dist_anast_sten_pct'] =
            db_graft_data_i['graft_dist_anast_sten_pct'];
        }
      } //for graft_template

      //"cath_graft_prox_site"
    } //for db_graft_data
  }
  /////////////////////////
  graft_segment_paths(graft, path_all_points) {
    let ostial_points = path_all_points.slice(0, 3);
    let proximal_points = path_all_points.slice(2, 6);
    let mid_points = path_all_points.slice(5, 10);
    let distal_points = path_all_points.slice(9, 13);
    let distal_anast_points = path_all_points.slice(12, 14);
    let t_origin_points = path_all_points.slice(3, 4);

    let graft_lesions_line = d3
      .line()
      .x(function (d) {
        return d.x;
      })
      .y(function (d) {
        return d.y;
      })
      // .curve(d3.curveCatmullRom.alpha(0.3));
      // .curve(d3.curveBundle)
      //.curve(d3_shape.curveCardinal)
      //.curve(d3.curveMonotoneY);
      .curve(d3.curveNatural);

    let ostial_path = graft_lesions_line(ostial_points);
    let proximal_path = graft_lesions_line(proximal_points);
    let mid_path = graft_lesions_line(mid_points);
    let distal_path = graft_lesions_line(distal_points);
    let distal_anast_path = graft_lesions_line(distal_anast_points);
    let t_origin_path = graft_lesions_line(t_origin_points);


    //////////////////////
    this.insert_graft_xy(
      graft,
      'ostial_graft_x',
      'ostial_graft_y',
      ostial_points,
    );
    this.insert_graft_xy(
      graft,
      'proximal_graft_x',
      'proximal_graft_y',
      proximal_points,
    );
    this.insert_graft_xy(
      graft,
      'mid_graft_x',
      'mid_graft_y',
      mid_points);
    this.insert_graft_xy(
      graft,
      'distal_graft_x',
      'distal_graft_y',
      distal_points,
    );
    this.insert_graft_xy(
      graft,
      'distal_anast_graft_x',
      'distal_anast_graft_y',
      distal_anast_points,
    );

    this.insert_graft_xy(
      graft,
      't_graft_origin_x',
      't_graft_origin_x',
      t_origin_points,
    );
    /////////////////
    this.insert_graft_path(graft, 'ostial_path', ostial_path);
    this.insert_graft_path(graft, 'proximal_path', proximal_path);
    this.insert_graft_path(graft, 'mid_path', mid_path);
    this.insert_graft_path(graft, 'distal_path', distal_path);
    this.insert_graft_path(graft, 'distal_anast_path', distal_anast_path);
    this.insert_graft_path(graft, 't_graft_origin_path', t_origin_path);

    this.insert_t_graft_origin_path(graft, 't_graft_origin_path', t_origin_path);

  } //function graft_segment_paths

  insert_graft_xy(graft, position_x, position_y, points) {
    let draw_template = get_draw_grafts_template();

    for (let i = 0; i < draw_template.length; i++) {

      this.points2rect.make(points);

      let draw_template_i = draw_template[i];
      if (draw_template_i['cath_graft_prox_site'] == graft) {
        draw_template_i[position_x] = points[0]['x'];
        draw_template_i[position_y] = points[0]['y'];
      } //if
    } //for
  } //insert_graft_xy
  //////////////////////////////////////////
  insert_t_graft_origin_path(graft, seg_path, path) {
    let g = new Cor_tree_grafts()
    let template = g.set_graph();
    let node_exists = template.hasNode(graft)
    if (node_exists === true) {
      template.setNodeAttribute(graft, "t_graft_origin_path", path)


    }

  }
  //////////////////////
  insert_graft_path(graft, seg_path, path) {
    let draw_template = get_draw_grafts_template();
    for (let i = 0; i < draw_template.length; i++) {
      let draw_template_i = draw_template[i];
      if (draw_template_i['cath_graft_prox_site'] == graft) {

        draw_template_i[seg_path] = path;
      } //if
    }

    //cath_graft_prox_site
  } //insert_graft_path;

  ////////////////////
} //class Cath_paths

export class Interface_buttons {
  constructor() {
    this.make_button();
    //let info_coronary_data = INFO_CORONARY_DATA;
    this.guides = new Guides();
    //this.utility = new Utility();
    this.bullets_group = this.guides.make_bullets(this.vis);
  } //constructor

  make_button() {
    /******************
     * button show All
     * ***************/

    let button = document.createElement('button');
    button.innerHTML = 'Show  - Redraw Cor Tree';
    button.classList.add('is-small');
    button.classList.add('is-primary');
    button.classList.add('button');
    let draw_div = document.querySelector('#draw_info_coronary_button_div');
    if (draw_div !== null) {
      draw_div.appendChild(button);
      button.addEventListener(
        'click',
        function () {
          let main_svg = d3.select('#main_svg');
          if (main_svg !== null) {
            d3.select('#main_svg')
              .transition()
              .duration(1500)
              .ease(d3.easeLinear)
              .style("fill", "#000")
              .attr('opacity', d => 0.1)
              .remove();

            g_draw_n_template.clear();
            draw_symbols_template.length = 0;

            let setup = new Set_sketch();
            ////////////////////////////////
            let vis = setup.vis();
            let paths = new Main_tree(vis);
          }
        }, //click
      ); //click
    } //if draw_div

    /***************
     * button dendrogram
     * ******************/
    let d_button = document.createElement('button');
    d_button.innerHTML = 'Show  - Cor Dendrogram';
    d_button.classList.add('is-small');
    d_button.classList.add('is-success');
    d_button.classList.add('button');

    let draw_div_d_button = document.querySelector('#draw_info_coronary_button_div');

    if (draw_div_d_button !== null) {
      draw_div.appendChild(d_button);
      d_button.addEventListener(
        'click',
        function () {
          let dendro = new Show_dendrogram()
          dendro.show_dendrogram()
        }

        /*
        function() {
          let main_svg = d3.select('#main_svg');
          if (main_svg !== null) {
            d3.select('#main_svg').remove();
            let setup = new Set_sketch();
            ////////////////////////////////
            let vis = setup.vis();
            let paths = new Main_tree(vis);
          }
        }, //click
        */
      ); //click


      //////////////
    } //if draw_div_d_button



    /***********************
     * Button Show Collaterals
     * ********************/
  } //make button
} //class DrawCoronay
/////////////////
class Show_dendrogram {
  constructor() { }; //

  show_dendrogram() {
    let main_svg = d3.select('#main_svg');
    main_svg.remove()
    let setup = new Set_sketch();
    ////////////////////////////////
    let vis = setup.vis();

    let guides = new Guides();
    let bullets_group = guides.make_bullets(vis);

    let draw_n_template = get_draw_n_template();
    //let data2draw = get_draw_n_template();
    let data2draw = g_draw_n_template.export()
    let draw_graft_template = get_draw_grafts_template()
    let cor_dendrogram = new Cor_dendrogram(bullets_group,
      data2draw,
      draw_graft_template
    );


    //alert("---show dendro")
  }; //show_dendro
}
//////////////////////////

class Draw_natives {
  constructor(d3) {
    this.d3 = d3;
    this.property = new Segment_property(this.d3);
    this.utility = new Utility();
    this.g = new Cor_tree_graph();
  } //constructor

  make(bullets_group) {
    ////////////get to draw natives tempate


    let patient_data = [];

    //let all_graph_data = g_draw_n_template.export()
    let all_graph_data = g_draw_n_template.export()
    /////////////////
    for (let i = 0; i < all_graph_data.nodes.length; i++) {

      patient_data.push(all_graph_data.nodes[i]['attributes'])

    }
    //////////////////////
    this.data = patient_data;


    this.lesion = new Native_lesions();

    let vessel_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'vessel_group')
      .data(this.data);

    let group_enter = vessel_group
      .enter()
      .append('g')
      .attr('id', 'native_group_enter');

    let line = d3
      .line()
      .x(function (d) {
        return d.x;
      })
      .y(function (d) {
        return d.y;
      })
      // .curve(d3.curveCatmullRom.alpha(0.3));
      //.curve(d3.curveBundle);
      //.curve(d3.curveCardinal);
      //.curve(d3.curveMonotoneY);
      .curve(d3.curveNatural);
    ////////////////////////


    /******************************/

    let paths = group_enter
      .append('path')
      .attr('id', (d) => {
        return this.dom + '_' + d.id
      })
      .attr('class', (d, i) => 'native')
      .attr('d', d => {
        let all_points = this.utility.path_to_all_points(d.path);
        let natives_path = line(all_points);
        return natives_path;
      })
      .attr('stroke-width', d => {
        return d.size * mag_size * 1.1;
      })
      //.style('stroke', 'url(#vessel_gradient)')
      .style('stroke', (d) => {
        if (d.is_variant == "Y") {
          //return "#FF9933";
          return "url(#variant_gradient)"
        } else {
          return "url(#vessel_gradient)"
        }
      })
      .style('stroke-linecap', 'round')
      .style('stroke-join', 'round')
      .style('fill', 'none')
      .attr('opacity', d => 0.9);


    ///////////////////


    let over = group_enter.on('mouseover', d => {
      d3.select('#' + this.dom + '_' + d.id)
        .transition()
        .duration(1500)
        .attr('stroke-width', d => d.size * mag_size * 1.5)
        .style('stroke', 'url(#symbol_gradient)')
        .attr('cursor', 'pointer')
    });

    let out = group_enter.on('mouseout', d => {
      d3.select('#' + this.dom + '_' + d.id)
        .transition()
        .duration(1500)
        .attr('stroke-width', d => d.size * mag_size * 1.1)
        .style('stroke', 'url(#vessel_gradient)')
        .attr('cursor', 'default')
    });

    let over_2 = group_enter
      .on("mouseenter", (d, i) => {
        d3.select('#' + this.dom + '_' + d.id)
          .attr('cursor', 'pointer')
        this.find_lv_segments_2(this.data, d.id);
      });
    /*
      let mouse_click = group_enter.on('click', (d, i) => {
        this.find_lv_segments(this.data, d.id);
      });
     */
    //////////////////////

    let natives_title = this.property.title(group_enter);

    let natives_title_text = natives_title.text(
      d =>
        d.cor_les_pct +
        ' % ' +
        ' ' +
        d.id +
        ' : ' +
        d.description_name +
        ' : ' +
        d.seg_def,
    );
  } //make

  //for aha segments
  find_lv_segments(patient_data, id) {
    let graph = this.g.set_graph();
    for (let i = 0; i < patient_data.length; i++) {
      let native = patient_data[i];

      /////////
      graph.forEachNode((native, attributes) => {
        let group_aha = attributes['vessel_group_aha'];
        let native_id = attributes['id'];

        if (native_id == id) {
          for (let j = 0; j < vessel_lv_territories_aha.length; j++) {
            let lv_t_group = vessel_lv_territories_aha[j];

            if (lv_t_group['vessel_group_aha'] == group_aha) {
              this.color_lv_segments(lv_t_group);
            }
          }
        }
      });
    } //for i
    /////////////////////
  } //end find_lv

  ///////////////////

  find_lv_segments_2(patient_data, id) {
    let seg_data = get_segments_data_aha();
    for (let i = 0; i < patient_data.length; i++) {
      let native = patient_data[i];
      for (let j = 0; j < seg_data.length; j++) {
        if (id == seg_data[j]["vessels"]) {
          this.color_lv_segments_2(seg_data[j]['id']);

        }
      }
      /////////

    } //for i
    /////////////////////
  } //end find_lv

  ////////////////////

  color_lv_segments_2(id) {
    d3.selectAll("#" + "arc_path_" + id)
      .transition()
      .duration(2500)
      //.ease(d3.easeLinear)
      .style("opacity", 0.9)
      //.style('fill', '#d7191c')
      .style("fill", '#AD5CFF')
      .transition()
      .delay(1000)
      .duration(200)

      .ease(d3.easeLinear)
      .style("opacity", 0.9)
      .style("fill", "#000")
      .attr("stroke", "gray")
      .attr("stroke-width", 1.5)
    //.remove()


  }

  ////////// ////////////////////

  //////
  //['#d7191c','#fdae61','#abdda4','#2b83ba']
  color_lv_segments(lv_segments) {
    let color = get_segment_colors_aha();

    let primary = lv_segments['primary'];
    let secondary = lv_segments['secondary'];
    let tertiary = lv_segments['tertiary'];

    for (let i = 0; i < primary.length; i++) {
      let p = primary[i];
      d3.select('#' + 'arc_' + p)

        .transition()
        .duration(500)
        .style('fill', '#d7191c');
    } //color primary

    for (let i = 0; i < secondary.length; i++) {
      let s = secondary[i];
      d3.select('#' + 'arc_' + s)
        .transition()
        .duration(1000)
        .style('fill', '#fdae61');
    } //color secondary

    for (let i = 0; i < tertiary.length; i++) {
      let t = tertiary[i];
      d3.select('#' + 'arc_' + t)
        .transition()
        .duration(1500)
        .style('fill', '#abdda4');
    } //color tertiary
  } //color_lv_segments
  /////////////

  /////////////////

  /////////////

  get_paths_from_n_template(d) {
    return d.path;
    //return d.path
  } //get_paths
  //////////////////
}; // class Draw_natives

///////////////////////////





//////////////////////
class Prepare_collaterals_data {
  constructor() {
    // this.db_collateral_data =  get_db_collaterals_data()
    this.draw_n_template = get_draw_n_template();
    this.utility = new Utility();
    this.calc = new Calc_paths();
    this.g = new Cor_tree_graph();
  } //constructor
  ///////////////////
  make_col_paths() {
    let db_col_data = get_db_collaterals_data();
    let graph = this.g.set_graph();

    for (let i = 0; i < db_col_data.length; i++) {
      let start_end = {
        donor_name: '',
        donor_path: '',
        recipient_name: '',
        recipient_path: '',
        collateral_path: '',
        donor_x: '',
        donor_y: '',
      };
      let db_col_i = db_col_data[i];
      let db_donor = db_col_i['collat_donor_seg'];
      let db_recipient = db_col_i['collat_recipient_seg'];

      let attr_donor = graph.getNodeAttributes(db_donor);
      let donor_path = attr_donor['path'];
      let donor_name = attr_donor['id'];
      start_end['donor_name'] = donor_name;
      start_end['donor_path'] = donor_path;

      let attr_recipient = graph.getNodeAttributes(db_recipient);
      let recipient_path = attr_recipient['path'];
      let recipient_name = attr_recipient['id'];
      start_end['recipient_name'] = recipient_name;
      start_end['recipient_path'] = recipient_path;

      let collateral_points = this.make_col_points(donor_path, recipient_path);
      let line = d3
        .line()
        .x(d => {
          return d.x;
        })
        .y(d => {
          return d.y;
        })
        //.curve(d3.curveBundle);
        .curve(d3.curveNatural);

      let collateral_path = line(collateral_points);
      start_end['collateral_path'] = collateral_path;
      /******************
       * this is for the collateral indicator:
       * From where the collateral originates
       *******************/
      let reverse_collat = collateral_points.reverse();
      let donor_xy = reverse_collat.pop();
      let donor_x = donor_xy['x'];
      let donor_y = donor_xy['y'];

      start_end['donor_x'] = donor_x;
      start_end['donor_y'] = donor_y;
      ///////////////////////////

      draw_collaterals_template.push(start_end);
    } //for
  } //make_col_edges
  ///////////////////////
  make_col_points(donor_path, recipient_path) {
    /* old
               let p1 = this.utility.path_to_points(donor_path)
               let p2 = this.utility.path_to_points(recipient_path)
               let all_points = this.calc.create_points_at_distance(p1, p2)
            */

    /////////////////////
    let p1_d = this.utility.path_to_all_points(donor_path);
    let p2_r = this.utility.path_to_all_points(recipient_path);
    let p1 = p1_d.pop();
    let p2 = p2_r.pop();

    let all_points = this.calc.create_points_at_distance(p1, p2);

    return all_points;
  }
  //////////////////////////////

  /////////////////////////////

  draw_collaterals(bullets_group) {
    let draw_template = get_draw_collaterals_template();
    let collat_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'collateral_group')
      .data(draw_template);

    let collat_group_enter = collat_group
      .enter()
      .append('g')
      .attr('id', d => {
        return d['donor_name'] + '_' + d['recipient_name'] + 'enter';
      });

    let collat_paths = collat_group_enter
      .append('path')
      .attr('id', d => {
        return d['donor_name'] + d['recipient_name'];
      })
      .attr('d', d => {
        let collateral_path = d.collateral_path;
        if (collateral_path !== '') {
          return d.collateral_path;
        }
      })
      .attr('stroke-width', d => {
        return mag_size * 1.4;
      })
      .style('stroke', 'url(#collateral_gradient)')
      .style('fill', 'none')
      .style('stroke-linecap', 'round')
      .style('stroke-join', 'bevel')
      .attr('opacity', d => 0.6)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Collateral From: ' + d.donor_name + ' To: ' + d.recipient_name;
      });
    //////////////////
    let indicator = collat_group_enter
      .append('circle')
      .attr('cx', 0)
      .attr('cy', 0)
      .attr('r', mag_size * 2, 5)
      .style('stroke-width', mag_size * 1.1)
      .style('stroke', '#fdae6b')
      .style('fill', d => {
        return '#fee6ce';
      })
      .attr('transform', (d, i) => {
        if (d['donor_x'] !== '') {
          let x = d['donor_x'];
          let y = d['donor_y'];
          let rotate = 0;
          return (
            'translate(' + x + ',' + y + ')scale(1.1)rotate(' + rotate + ')'
          );
        }
      })
      .style('opacity', 0.4);

    //////////////////////////
    let on_collateral_over = collat_group_enter.on('mouseover', d => {
      d3.select('#' + d['donor_name'] + d['recipient_name'])
        .transition()
        .duration(1500)
        .attr('opacity', d => 0.9)
        .attr('stroke-width', d => {
          return mag_size * 2.8;
        })
        .style('stroke', 'red')
        .transition()
        .attr('stroke-width', d => {
          return mag_size * 1.4;
        })
        .style('stroke', 'url(#collateral_gradient)')
        .style('fill', 'none')
        .attr('opacity', d => 0.6);

      //.scale((d) => { return d.size * mag_size * 2 });
    });

    /////////////
  } //draw_collaterals

  ///////////////////
} //class Prepare_collaterals_data
////////////////
/*******************************/

class Prepare_natives_variants {
  constructor() {
    this.utility = new Utility();
    this.db_anatomy_data = get_db_anatomy_data();
    this.db_data = get_db_data();
    this.db_lesion_data = get_db_lesions_data();
    this.g = new Cor_tree_graph();
  }

  /*
  cor_anat_variations_yn      | boolean                        |           | not null | false
   cor_anat_anomalies_yn       | boolean                        |           | not null | false
   cor_anat_dominance          | character varying(50)          |           |          |
   cor_anat_lm_ostium_type     | character varying(50)          |           |          |
   cor_anat_lm_type            | character varying(50)          |           |          |
   cor_anat_rca_type           | character varying(50)          |           |          |
   cor_anat_rca_ostium_type    | character varying(50)          |           |          |
   cor_anat_rca_mid_type       | character varying(50)          |           |          |
   cor_anat_rca_rv_branch_type | character varying(50)          |           |          |
   cor_anat_rca_distal_type    | character varying(50)          |           |          |
   cor_anat_rca_pda_type       | character varying(50)          |           |          |
   cor_anat_lad_ostium_type    | character varying(50)          |           |          |
   cor_anat_lad_prox_type      | character varying(50)          |           |          |
   cor_anat_lad_mid_type       | character varying(50)          |           |          |
   cor_anat_septal_ostium_type | character varying(50)          |           |          |
   cor_anat_lad_distal_type    | character varying(50)          |           |          |
   cor_anat_lad_d1_type        | character varying(50)          |           |          |
   cor_anat_lad_d2_type        | character varying(50)          |           |          |
   cor_anat_lad_d3_type        | character varying(50)          |           |          |
   cor_anat_sino_atrial_type   | character varying(50)          |           |          |
   cor_anat_lcx_type           | character varying(50)          |           |          |
   cor_anat_lcx_ostium_type    | character varying(50)          |           |          |
   cor_anat_lcx_prox_type      | character varying(50)          |           |          |
   cor_anat_lcx_mid_type       | character varying(50)          |           |          |
   cor_anat_lcx_distal_type    | character varying(50)          |           |          |
   cor_anat_lcx_om1_type       | character varying(50)          |           |          |
   cor_anat_lcx_om2_type       | character varying(50)          |           |          |
   cor_anat_lcx_om3_type       | character varying(50)          |           |          |
   cor_anat_ramus_type         | character varying(50)          |           |          |
   cor_anat_pl_type            | character varying(50)          |           |          |
   cor_anat_conus_type         | character varying(50)          |           |          |
   cor_anat_notes              | text                           |           |          |
   info_coronary_id            | bigint                         |           |          |
   inserted_at                 | timestamp(0) without time zone |           | not null |
   updated_at                  | timestamp(0) without time zone |           | not null |

  */

  /*****************************/
  set_variant_segment(field, normal_segment) {

    let graph = this.g.set_graph();

    let a_variant = this.db_anatomy_data[field]
    if (a_variant == 'undefined' || a_variant == null) {
      let default_variant = normal_segment;
      let d_node = graph.getNodeAttributes(default_variant);
      return d_node;
    }

    if (this.db_lesion_data.length !== 0 &&
      this.db_lesion_data.length !== null
    ) {

      for (let i = 0; i < this.db_lesion_data.length; i++) {
        let d_i = this.db_lesion_data[i];
        let a_node = graph.getNodeAttributes(a_variant);
        return a_node;
      } //for lesion_data
    }
  }; //set_variant_segment


  //////////////////////////////


  add_variants() {
    //////////////
    // let lm_ostium_data = this.lm_ostium();
    //g_draw_n_template.addNode(lm_ostium_data['id'], lm_ostium_data);
    let lm_ostium_data = this.set_variant_segment('cor_anat_lm_ostium_type', 'lm_ostium');
    g_draw_n_template.addNode(lm_ostium_data['id'], lm_ostium_data);

    //////////////////////
    let lad_ostium_data = this.set_variant_segment('cor_anat_lad_ostium_type', 'lad_ostium');
    g_draw_n_template.addNode(lad_ostium_data['id'], lad_ostium_data)

    /////////////////////////

    let lad_prox_data = this.set_variant_segment('or_anat_lad_prox_type', 'lad_prox');
    g_draw_n_template.addNode(lad_prox_data['id'], lad_prox_data)
    /////////////////////////

    let lad_septal_data = this.set_variant_segment('cor_anat_septal_ostium_type', 'lad_septal');
    g_draw_n_template.addNode(lad_septal_data['id'], lad_septal_data)
    ///////////////////////
    let lad_d3_data = this.set_variant_segment('cor_anat_lad_d3_type', 'lad_d3');
    g_draw_n_template.addNode(lad_d3_data['id'], lad_d3_data)
    /////////////////////////
    //  let lad_distal_data = this.set_variant_segment('cor_anat_lad_distal_type', 'lad_distal');
    let lad_distal_data = this.set_variant_segment('cor_anat_lad_distal_type', 'lad_distal');
    g_draw_n_template.addNode(lad_distal_data['id'], lad_distal_data)
    /////////////////////////
    let ramus_data = this.set_variant_segment('cor_anat_ramus_type', 'ramus');
    g_draw_n_template.addNode(ramus_data['id'], ramus_data)


    ////////////////////
    let ostial_rca_data = this.set_variant_segment('cor_anat_rca_ostium_type', 'rca_ostium');
    g_draw_n_template.addNode(ostial_rca_data['id'], ostial_rca_data)
    /////////////////////////////////////////////////////
    let rca_conus_data = this.set_variant_segment('cor_anat_conus_type', 'rca_conus');
    g_draw_n_template.addNode(rca_conus_data['id'], rca_conus_data)
    /////////////////////////////////////////////////////
    let rca_v_branch_data = this.set_variant_segment('cor_anat_rca_rv_branch_type', 'rca_v_branch_normal');
    g_draw_n_template.addNode(rca_v_branch_data['id'], rca_v_branch_data)
    /////////////////////////////////////////////////////
    let rca_sa_data = this.set_variant_segment('cor_anat_sino_atrial_type', 'rca_sa');
    g_draw_n_template.addNode(rca_sa_data['id'], rca_sa_data)
    //////////////////////
    let distal_rca_pda_data = this.set_variant_segment('cor_anat_rca_pda_type', 'rca_pda');
    g_draw_n_template.addNode(distal_rca_pda_data['id'], distal_rca_pda_data)


    ////////////////
    let ostial_lcx_data = this.set_variant_segment('cor_anat_lcx_ostium_type', 'lcx_ostium');
    g_draw_n_template.addNode(ostial_lcx_data['id'], ostial_lcx_data)



  }
  set_defaults() {


    let graph = this.g.set_graph();

    let lm_default = 'lm_ostium';
    let lm_attributes = graph.getNodeAttributes(lm_default);
    g_draw_n_template.addNode(lm_attributes['id'], lm_attributes)

    ///////////////////////////////////
    let lad_ostium_default = 'lad_ostium';
    let lad_ostium_attributes = graph.getNodeAttributes(lad_ostium_default);
    g_draw_n_template.addNode(lad_ostium_attributes['id'], lad_ostium_attributes)
    ////////////////////
    ///////////////////////////////////
    let lad_prox_default = 'lad_prox';
    let lad_prox_attributes = graph.getNodeAttributes(lad_prox_default);
    g_draw_n_template.addNode(lad_prox_attributes['id'], lad_prox_attributes)
    ////////////////////
    ///////////////////////////////////
    let lad_septal_default = 'lad_septal';
    let lad_septal_attributes = graph.getNodeAttributes(lad_septal_default);
    g_draw_n_template.addNode(lad_septal_attributes['id'], lad_septal_attributes)
    ////////////////////
    let ramus_default = 'ramus';
    let ramus_attributes = graph.getNodeAttributes(ramus_default);
    g_draw_n_template.addNode(ramus_attributes['id'], ramus_attributes)
    ////////////////////
    let distal_lad_default = 'lad_distal_type_ii';
    let distal_lad_attributes = graph.getNodeAttributes(distal_lad_default);
    g_draw_n_template.addNode(distal_lad_attributes['id'], distal_lad_attributes)
    //////////////////////////////
    let ostial_rca_default = 'rca_ostium';
    let ostial_rca_attributes = graph.getNodeAttributes(ostial_rca_default);
    g_draw_n_template.addNode(ostial_rca_attributes['id'], ostial_rca_attributes)
    //////////////////////////////
    /////////////////////////////
    let rca_conus_default = 'rca_conus';
    let rca_conus_attributes = graph.getNodeAttributes(rca_conus_default);
    g_draw_n_template.addNode(rca_conus_attributes['id'], rca_conus_attributes)
    /////////////////////////////
    let sino_atrial_default = 'rca_sa';
    let sino_atrial_attributes = graph.getNodeAttributes(sino_atrial_default);
    g_draw_n_template.addNode(sino_atrial_attributes['id'], sino_atrial_attributes)
    //////////////////////////////
    let distal_rca_pda_default = 'rca_pda';
    let distal_rca_pda_attributes = graph.getNodeAttributes(distal_rca_pda_default);
    g_draw_n_template.addNode(distal_rca_pda_attributes['id'], distal_rca_pda_attributes)
    //////////////////////////////
    let ostial_lcx_default = 'lcx_ostium';
    let ostial_lcx_attributes = graph.getNodeAttributes(ostial_lcx_default);
    g_draw_n_template.addNode(ostial_lcx_attributes['id'], ostial_lcx_attributes)
    //////////////////////////////

    ////////////////
  }; //

  //////////////////////////////
} //class Prepare_natives_variations
/*******************************/
class Prepare_natives_data {

  constructor() {
    this.utility = new Utility();
    this.variant = new Prepare_natives_variants();
    this.g = new Cor_tree_graph();

  }; //constructor

  set_lesions() {

    let db_les_data = get_db_lesions_data();
    for (let i = 0; i < db_les_data.length; i++) {
      let les_data = db_les_data[i];
      let les_data_cdisc = les_data['cor_les_seg_cdisc']

      ////////////////////////////

      g_draw_n_template.setNodeAttribute(les_data_cdisc, 'cor_les_thrombus_yn', les_data['cor_les_thrombus_yn'])
      g_draw_n_template.setNodeAttribute(les_data_cdisc, 'cor_les_calcium_yn', les_data['cor_les_calcium_yn'])
      g_draw_n_template.setNodeAttribute(les_data_cdisc, 'cor_les_aneurysm_yn', les_data['cor_les_aneurysm_yn'])
      g_draw_n_template.setNodeAttribute(les_data_cdisc, 'cor_les_prior_stent_yn', les_data['cor_les_prior_stent_yn'])
      g_draw_n_template.setNodeAttribute(les_data_cdisc, 'cor_les_pct', les_data['cor_les_pct'])


    }; //for
    //////////////////////
  }; //set_lesions_2

  set_graph_x_y() {
    g_draw_n_template.forEachNode((node, attributes) => {
      this.insert_graph_x_y(node)

    });

    //  g_draw_n_template.for_each_node();

  }; //set_graph_x_y

  insert_graph_x_y(node) {

    let lesion_path = g_draw_n_template.getNodeAttribute(node, "lesion_path")
    let lesion_exists = g_draw_n_template.hasNodeAttribute(node, "lesion_path")


    if (lesion_path !== '' && lesion_exists == true) {
      //  if (lesion_exists == true) {
      let lesion_points = this.utility.path_to_points(lesion_path);
      let lesion_p_x = lesion_points.x;
      let lesion_p_y = lesion_points.y;
      //console.log("---------------x y--------")
      //console.log(node)
      // console.log(lesion_p_x)
      // console.log(lesion_p_y)
      g_draw_n_template.setNodeAttribute(node, 'lesion_x', lesion_p_x)
      g_draw_n_template.setNodeAttribute(node, 'lesion_y', lesion_p_y)

    }; //if


    let stent_path = g_draw_n_template.getNodeAttribute(node, "stent_path")
    let stent_exists = g_draw_n_template.hasNodeAttribute(node, "stent_path")

    if (stent_path !== '' && stent_exists == true) {
      let stent_points = this.utility.path_to_points(stent_path);
      let stent_p_x = stent_points.x;
      let stent_p_y = stent_points.y;

      g_draw_n_template.setNodeAttribute(node, 'stent_x', stent_p_x)
      g_draw_n_template.setNodeAttribute(node, 'stent_y', stent_p_y)
    }; //if

    let graft_path = g_draw_n_template.getNodeAttribute(node, "graft_path")
    let graft_exists = g_draw_n_template.hasNodeAttribute(node, "graft_path")

    if (graft_path !== '' && graft_path == true) {
      let graft_points = this.utility.path_to_points(graft_path);
      let graft_p_x = graft_points.x;
      let graft_p_y = graft_points.y;

      g_draw_n_template.setNodeAttribute(node, 'graft_x', graft_p_x)
      g_draw_n_template.setNodeAttribute(node, 'graft_y', graft_p_y)
    }; //if




  }
  ////////////////////////////
  make_draw_natives_template() {
    let dominance = get_db_dominance();
    let graph = this.g.set_graph();

    graph.forEachNode((node, attributes) => {

      let lcx_dom_draw = attributes['lcx_dom_draw'];
      let rca_dom_draw = attributes['rca_dom_draw'];
      let balanced_dom_draw = attributes['balanced_dom_draw'];
      let default_draw = attributes['default_draw'];
      ////////////
      switch (dominance) {
        case 'rca': {
          if (rca_dom_draw == 'Y') {
            g_draw_n_template.addNode(node, attributes)


          } //if rca_dominance
          break;
        }
        case 'left': {
          if (lcx_dom_draw == 'Y') {

            g_draw_n_template.addNode(node, attributes)

          } //if left_dominance
          break;
        }
        case 'balanced': {
          if (balanced_dom_draw == 'Y') {

            g_draw_n_template.addNode(node, attributes)


          } //if balanced_dominance
          break;
        }

        case 'default': {
          if (default_draw == 'Y') {

            g_draw_n_template.addNode(node, attributes)


          } //default
          break;
        } //case default

        case '': {
          console.log('Somthing wrong');
        }
      } //dominance

      //////////
    }); //for

    /*******For Variations of coronaries*********************/
    let db_anatomy_data = get_db_anatomy_data();

    if (typeof db_anatomy_data !== 'undefined' && db_anatomy_data) {
      this.variant.add_variants();
    } else {

      this.variant.set_defaults()
    }

    ///////////////////////


  } //end draw_n_template

  //////////////end Prepare_natives_data
}; //class Prepare_natives_data
/////////////////////////////////



///////////////////////////////
class Native_lesions {
  constructor(d3) {
    this.d3 = d3;
    this.prepare_data = new Prepare_natives_data();
    this.utility = new Utility();
    this.g = new Cor_tree_graph();

  } //coonstructor
  /*
    find_lesion_path(d) {
      this.pt_lesion_id = d;
      let db_les_data = get_db_lesions_data();
      let draw_n_template = get_draw_n_template();
      let a_path = this.get_path_from_template(
        draw_n_template,
        this.pt_lesion_id,
        db_les_data,
      );

      return a_path;
    }
  */
  /*
    get_path_from_template(draw_n_template, pt_lesion_id, db_les_data) {
      this.pt_lesion_id = pt_lesion_id;
      let draw_n_template_keys = Object.keys(draw_n_template);

      for (const draw_n_template_key of draw_n_template_keys) {
        let draw_n_template_id = draw_n_template[draw_n_template_key];
        if (pt_lesion_id == draw_n_template_id['id']) {
          let path = draw_n_template_id['lesion_path'];
          return path;
        } //if
      } //for
    } //get path_from_template
    */
  //////////////end Lesion/////
  draw_lesions(group) {

    let lesions_data = [];
    let all_graph_data = g_draw_n_template.export()
    /////////////////
    for (let i = 0; i < all_graph_data.nodes.length; i++) {
      if (all_graph_data.nodes[i]['attributes']['cor_les_pct'] !== "") {
        let node_id = all_graph_data.nodes[i]['attributes']['id']
        let node_attr = g_draw_n_template.getNodeAttributes(node_id);
        lesions_data.push(node_attr)
      }
    }


    ///////////////////////


    let lesions_group = group
      .append('g')
      .selectAll('g')
      .attr('id', 'lesions_group')
      .data(lesions_data);

    let lesions_group_enter = lesions_group
      .enter()
      .append('g')
      .attr('id', d => {
        return d['id'] + '_' + 'lesions_group_enter';
      });

    let percent_scale = d3
      .scaleLinear()
      .domain([0, 100])
      .range([0, 6]);

    let lesion_drop = lesions_group_enter
      .append('circle')
      .attr('cx', '10px')
      .attr('cy', '10px')
      .attr('r', d => d.size * mag_size * 1.2)
      //.attr('id', 'a_lesion_drop')
      .attr('id', d => {
        return d['id'] + '_' + 'lesion_drop';
      })
      .style('stroke-width', "1px")
      .style('stroke', 'red')
      .style('fill', 'url(#lesion_gradient)')
      .attr('transform', (d, i) => {

        if (typeof d['lesion_x'] !== 'undefined' && d['lesion_x']) {
          let l_x = d['lesion_x']
          let l_y = d['lesion_y'];
          let point = this.utility.circumference_point(l_x, l_y, 1);
          let x = point.x;
          let y = point.y;
          let rotate = 1;
          return (
            'translate(' + x + ',' + y + ')scale(1)rotate(' + rotate + ')'
          );
        }
      })
      //  .attr('transform', (d, i) => {
      //   if (typeof d['lesion_x'] !== 'undefined' && d['lesion_x']) {
      //    let x = d['lesion_x'] + d.size * mag_size * 1.4;
      //    let y = d['lesion_y'];
      //    let rotate = 90;
      //    return (
      //      'translate(' + x + ',' + y + ')scale(1.2)rotate(' + rotate + ')'
      //   );
      //  }
      // })
      .attr('opacity', d => 0.8)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return (
          ' Lesion in : ' + d.description_name + ' ' + d.cor_les_pct + ' (%) '
        );
      });

    //lesions_group_enter.on('click', this.on_lesion_drop_click);

    let lesion_pct_text = lesions_group_enter
      .append('text')
      .attr('dx', 25 + 'px')
      .attr('dy', 5 + 'px')
      .attr('fill', '#fff')
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.80em')
      .style('font-weight', 'normal')
      .style('opacity', '0.8')
      .style('stroke', 'none')
      .attr('transform', (d, i) => {
        if (d.lesion_x !== '') {
          let x = d['lesion_x'] - 10;
          let y = d['lesion_y'] + 10;
          return 'translate(' + x + ',' + y + ')scale(1)rotate(5)';
        }
      })
      .attr('cursor', 'pointer')
      .text(d => {
        return d.cor_les_pct + '(%)';
      });


  } //draw_lesions

} ////end of class draw_lesions////////////

////////////////
///////////////////////////////

////////////////
class Prepare_symbols_data {
  constructor() {

  } //constructor
  ///////////////////////////////////////////////
  set_data() {
    let thrombus_data = this.make_symbol_data(
      'cor_les_thrombus_yn',
      'thrombus',
      'Segment With Thrombus',
    );
    let calcium_data = this.make_symbol_data(
      'cor_les_calcium_yn',
      'calcium',
      'Calcified Region',
    );

    let interv_data = this.make_symbol_data(
      'cor_les_prior_stent_yn',
      'prior_intervention',
      'Segment With Prior Intervention',
    );

    let irregular_data = this.make_symbol_data(
      'irregular_yn',
      'irregular',
      'Segment With Irregularities',
    );

  }; //set_data

  /////////////////////////////
  find_symbol_path(symbol_name) {
    let symbols = get_symbols();
    for (let i = 0; i < symbols.length; i++) {
      let symbol_i = symbols[i];
      if (symbol_i['id'] == symbol_name) {
        let symbol_path = symbol_i['path'];
        return symbol_path;
      } //if
    } //for
  } //find_symbol

  make_symbol_data(characteristic, symbol_name, description) {

    let all_graph_data = g_draw_n_template.export()
    /////////////////
    for (let i = 0; i < all_graph_data.nodes.length; i++) {
      if (all_graph_data.nodes[i]['attributes'][characteristic] == true) {

        let node_id = all_graph_data.nodes[i]['attributes']['id']
        let node_lesion_x = all_graph_data.nodes[i]['attributes']['lesion_x']



        let node_lesion_y = all_graph_data.nodes[i]['attributes']['lesion_y']

        let node_attr = g_draw_n_template.getNodeAttributes(node_id);
        let symbol_path = this.find_symbol_path(symbol_name);


        let symbol_data = {
          id: node_id,
          path: symbol_path,
          symbol: symbol_name,
          description: description,
          lesion_x: node_lesion_x,
          lesion_y: node_lesion_y
        }; //symbol_data

        draw_symbols_template.push(symbol_data)
      }
    }

  }
  ///////////////////////////////
}; //class Prepare_symbols_data

////////////////////////
class Draw_grafts {
  constructor() {
    this.utility = new Utility();
    this.calc = new Calc_paths();
  } //constructor

  show_grafts(bullets_group) {
    let graft_data = get_draw_grafts_template();


    let graft_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'graft_group')
      .data(graft_data);

    let graft_group_enter = graft_group
      .enter()
      .append('g')
      .attr('id', 'graft_group_enter');

    let graft_paths_start = graft_group_enter
      .append('path')
      .attr('id', d => {
        return d['cath_graft_prox_site'] + '_' + 'start';
      })
      .attr('d', d => {
        let prox_path = d.prox_path;
        if (prox_path !== '') {
          return d.prox_path;
        }
      })
      .attr('stroke-width', d => {
        return d.size * mag_size * 1.3;
      })
      .style('stroke', '#8dd3c7')
      //.style("stroke", "url(#stent_gradient)")
      .style('fill', 'none')
      .style('stroke-linecap', 'squere')
      .style('stroke-join', 'bevel')
      .attr('opacity', d => 0.8);

    let graft_paths_end = graft_group_enter
      .append('path')
      .attr('id', d => {
        return d['cath_graft_prox_site'] + '_' + 'end';
      })
      .attr('d', d => {
        let path = d['distal_anast_path'];
        return path;
      })
      .attr('stroke-width', d => {
        return d.size * mag_size * 1.3;
      })
      //    .style("stroke", "url(#stent_gradient)")
      .style('stroke', '#8dd3c7')
      .style('fill', 'none')
      .style('stroke-linecap', 'squere')
      .style('stroke-join', 'bevel')
      .attr('opacity', d => 0.8);

    let graft_paths = graft_group_enter
      .append('path')
      .attr('id', d => {
        return d['cath_graft_prox_site'] + '_' + 'graft_paths';
      })
      .attr('d', d => {
        let graft = d['cath_graft_prox_site'];
        let path = this.calc.build_graft_paths(d, graft);
        return path;
      })
      .attr('stroke-width', d => {
        return d.size * mag_size * 0.7;
      })
      .style('stroke', 'url(#vessel_gradient)')
      .style('fill', 'none')
      .style('stroke-linecap', 'round')
      .style('stroke-join', 'round')
      .attr('opacity', d => 0.6)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return (
          ' Graft From: ' +
          d.proximal_site +
          ' To: ' +
          d.cath_graft_segments_cdisc +
          ' Type: ' +
          d.cath_graft_conduit_type
        );
      });

    let over = graft_group_enter.on('mouseover', d => {
      d3.select('#' + d['cath_graft_prox_site'] + '_' + 'graft_paths')
        .transition()
        .duration(1500)
        .attr('opacity', d => 0.9)
        .attr('stroke-width', d => d.size * mag_size)
        .style('stroke', 'url(#symbol_gradient)')
        .attr('cursor', 'pointer');
      //.scale((d) => { return d.size * mag_size * 2 });
    });
    //////////////
    let out = graft_group_enter.on('mouseout', d => {
      d3.select('#' + d['cath_graft_prox_site'] + '_' + 'graft_paths')
        .transition()
        .attr('opacity', d => 0.6)
        .duration(500)
        .attr('stroke-width', d => d.size)
        .style('stroke', 'url(#vessel_gradient)')
        .attr('cursor', 'default');
    });

    let translate_interpolator = d3.interpolateString(
      start_translate,
      end_translate,
    );
    /////////////////
    let over_graft_click = graft_group_enter.on('click', d => {
      // d3.select("#" + d["cath_graft_prox_site"] + "_" + 'graft_paths')
      d3.select(this)
        .transition()
        .duration(5500)
        .ease('elastic')
        .attr('stroke-width', d => {
          return d.size * 1.0;
        })
        .style('stroke', 'white')
        .attr('transform', (d, i) => {
          return 'translate(' + 0 + ',' + 50 * i * 2 + ')scale(2)rotate(5)';
        });
    });

    /////////////////
  } //show

  ////////////////////////
  show_graft_segments(bullets_group) {
    let c10 = d3.scaleOrdinal(d3.schemeCategory10);

    let graft_data = get_draw_grafts_template();

    let graft_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'graft_group')
      .data(graft_data);

    let graft_group_enter = graft_group
      .enter()
      .append('g')
      .attr('id', 'graft_group_enter');

    ///////////////////////
    let ostial_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.ostial_graft_x;
      })
      .attr('cy', d => {
        return d.ostial_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.0;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(1))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.9;
      })
      .attr('opacity', 0.9)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Graft Segment: Start Of OSTIAL';
      });

    //////////////////////////////////
    let prox_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.proximal_graft_x;
      })
      .attr('cy', d => {
        return d.proximal_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.5;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(2))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.9)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Graft Segment: Start Of PROXIMAL 1/3 of Graft Lenght';
      });

    //////////////////////////////////
    let mid_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.mid_graft_x;
      })
      .attr('cy', d => {
        return d.mid_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.5;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(3))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.9)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Graft Segment: Start Of MID 1/3 of Graft Lenght';
      });

    //////////////////////////////////
    let distal_mark = graft_group_enter
      .append('ellipse')
      .attr('id', d => {
        'distal_mark' + '_' + d.id;
      })
      .attr('cx', d => {
        return d.distal_graft_x;
      })
      .attr('cy', d => {
        return d.distal_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.5;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', 'none')
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.9)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Graft Segment: Start DISTAL 1/3 of Graft Lenght';
      });

    let distal_mark_over = graft_group_enter.on('mouseover', d => {
      d3.select('#' + 'distal_mark' + '_' + d.id)
        .transition()
        .duration(1500)
        .attr('stroke-width', d => d.size * mag_size * 1.8)
        .style('stroke', '#8dd3c7')
        .attr('cursor', 'pointer');
    });


    //////////////////////////////////
    let distal_anast_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.distal_anast_graft_x;
      })
      .attr('cy', d => {
        return d.distal_anast_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.5;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(6))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Graft Segment: The DISTAL ANASTOMOTIC POSITION';
      });

    ////////////////////
  } //show_graft_segments
  //////////////////////
  show_graft_lesions(bullets_group) {
    let c10 = d3.scaleOrdinal(d3.schemeCategory10);

    let graft_lesions_data = get_draw_grafts_template();

    let graft_lesion_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'graft_lesions_group')
      .data(graft_lesions_data);

    let graft_lesion_group_enter = graft_lesion_group
      .enter()
      .append('g')
      .attr('id', 'graft_lesion_group_enter');

    let graft_ostial_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 15 + 'px')
      // .attr("fill", "#fff")
      .attr('fill', d => {
        let pct = parseInt(d.graft_ostial_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', d => {
        return d['ostial_graft_x'];
      })
      .attr('y', d => {
        return d['ostial_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_ostial_sten_pct != 'undefined' &&
          d.graft_ostial_sten_pct
        ) {
          return d.graft_ostial_sten_pct + ' ' + '%';
        }
      })
      .style('opacity', 0.7);
    // .style("text-shadow", "white 0 0 8px")
    //.transtion()
    //   .duration(5000)
    //    .styleTween('font', function(){
    //        return d3.interpolate('0.70em Helvetica', '1.8em  Helvetica')
    //   })

    ///////////////////
    let graft_ostial_lesion_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 10)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.5)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_ostial_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_ostial_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['ostialgraft_x'] !== '') {
          let x = d['ostial_graft_x'] + d.size * mag_size * 1.4;
          let y = d['ostial_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_ostial_sten_pct != 'undefined' &&
          d.graft_ostial_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      .append('title')
      .text(d => {
        return ' Lesion in Proximal: ' + d.proximal_site;
      });

    //////////////////////

    let graft_prox_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 15 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_prox_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393';
        }
      })

      .attr('x', d => {
        return d['proximal_graft_x'];
      })
      .attr('y', d => {
        return d['proximal_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_prox_sten_pct != 'undefined' &&
          d.graft_prox_sten_pct
        ) {
          return d.graft_prox_sten_pct + ' ' + '%';
        }
      });

    let graft_prox_lesion_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 10)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.5)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_prox_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_prox_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['proximal_graft_x'] !== '') {
          let x = d['proximal_graft_x'] + d.size * mag_size * 1.4;

          let y = d['proximal_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_prox_sten_pct != 'undefined' &&
          d.graft_prox_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      //.attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Lesion In Graft : ' + d.proximal_site;
      });

    //////////////
    let graft_mid_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 15 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_mid_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393';
        }
      })

      .attr('x', d => {
        return d['mid_graft_x'];
      })
      .attr('y', d => {
        return d['mid_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")

      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0. 7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_mid_sten_pct != 'undefined' &&
          d.graft_mid_sten_pct
        ) {
          return d.graft_mid_sten_pct + ' ' + '%';
        }
      });

    ///////////////

    let graft_mid_lesion_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 10)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.5)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_mid_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_mid_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['mid_graft_x'] !== '') {
          let x = d['mid_graft_x'] + d.size * mag_size * 1.4;

          let y = d['mid_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_mid_sten_pct != 'undefined' &&
          d.graft_mid_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      // .attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Lesion in Mid Graft : ' + d.proximal_site;
      })
      .text(d => {
        if (
          typeof d.graft_mid_sten_pct != 'undefined' &&
          d.graft_mid_sten_pct
        ) {
          return d.graft_mid_sten_pct + ' ' + '%';
        }
      });

    ////////////////////
    let graft_distal_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 15 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_dist_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })

      // .attr("fill", '#fff')
      .attr('x', d => {
        return d['distal_graft_x'];
      })
      .attr('y', d => {
        return d['distal_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_dist_sten_pct != 'undefined' &&
          d.graft_dist_sten_pct
        ) {
          return d.graft_dist_sten_pct + ' ' + '%';
        }
      });

    let graft_distal_lesion_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 10)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.5)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_dist_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_dist_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })

      .attr('transform', (d, i) => {
        if (d['lesion_x'] !== '') {
          let x = d['distal_graft_x'] + d.size * mag_size * 1.4;
          let y = d['distal_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_dist_sten_pct != 'undefined' &&
          d.graft_dist_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      // .attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Lesion in : ' + d.proximal_site;
      });

    let graft_distal_anast_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 15 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_dist_anast_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })

      .attr('x', d => {
        return d['distal_anast_graft_x'];
      })
      .attr('y', d => {
        return d['distal_anast_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style('font-family', 'impact, georgia, times, sans')
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_dist_anast_sten_pct != 'undefined' &&
          d.graft_dist_anast_sten_pct
        ) {
          return d.graft_dist_anast_sten_pct + ' ' + '%';
        }
      });

    let graft_distal_anast_lesion_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 10)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.5)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_dist_anast_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_dist_anast_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['distal_anast_graft_x'] !== '') {
          let x = d['distal_anast_graft_x'] + d.size * mag_size * 1.4;
          let y = d['distal_anast_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_dist_anast_sten_pct != 'undefined' &&
          d.graft_dist_anast_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      // .attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Lesion in : ' + d.proximal_site;
      });
  } //show_graft_lesion

  ///////////////////
} //Draw_grafts
////////////////////
/*********************************/
class Draw_t_grafts_lesions {
  constructor() {
    this.utility = new Utility();
  } //constructor

  show_t_graft_lesions(bullets_group) {
    let c10 = d3.scaleOrdinal(d3.schemeCategory10);

    let graft_lesions_data = get_draw_t_grafts_template();
    let graft_lesion_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 't_graft_lesions_group')
      .data(graft_lesions_data);

    let graft_lesion_group_enter = graft_lesion_group
      .enter()
      .append('g')
      .attr('id', 't_graft_lesion_group_enter');

    ///////////////
    let t_graft_lesion_ostial_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 15)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.4)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_ostial_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_ostial_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['ostial_graft_x'] !== '') {
          let x = d['ostial_graft_x'] + d.size * mag_size * 1.4;
          let y = d['ostial_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_ostial_sten_pct != 'undefined' &&
          d.graft_ostial_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      //.attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .on('click', d => {
        d3.event.preventDefault();
        return this.on_t_graft_lesion_click;
      })
      .append('title')
      .text(d => {
        return ' Lesion in Ostium of  T-Graft From: ' + d.proximal_site;
      });

    /*
    let graft_t_ostial_lesion_pct_text = this.utility.graft_lesion_pct_text(
         graft_lesion_group_enter,
         d['ostial_graft_x'],
         d['ostial_graft_y'],
         d.graft_ostial_sten_pct,

       );
     */
    /////////////////

    let t_graft_ostial_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 25 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_ostial_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', d => {
        return d['ostial_graft_x'];
      })
      .attr('y', d => {
        return d['ostial_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .attr('cursor', 'pointer')
      .text(d => {
        if (
          typeof d.graft_ostial_sten_pct != 'undefined' &&
          d.graft_ostial_sten_pct
        ) {
          return d.graft_ostial_sten_pct + ' ' + '%';
        }
      });

    let t_graft_lesion_prox_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 15)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.4)
      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_prox_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_prox_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['proximal_graft_x'] !== '') {
          let x = d['proximal_graft_x'] + d.size * mag_size * 1.4;
          let y = d['proximal_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_prox_sten_pct != 'undefined' &&
          d.graft_prox_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      //.attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {

        return ' Proximal Lesion in  T-Graft From: ' + d.proximal_site;
      });
    /*
      let graft_prox_lesion_pct_text = this.utility.graft_lesion_pct_text(
        graft_lesion_group_enter,
        d,
      'proximal_graft_x',
        'proximal_graft_y',
        graft_prox_sten_pct,

      );
      */

    let t_graft_prox_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 25 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_prox_sten_pct, 10);

        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', d => {
        return d['proximal_graft_x'];
      })
      .attr('y', d => {
        return d['proximal_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_prox_sten_pct != 'undefined' &&
          d.graft_prox_sten_pct
        ) {
          return d.graft_prox_sten_pct + ' ' + '%';
        }
      });

    let t_graft_lesion_mid_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 15)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.4)

      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_mid_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_mid_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['mid_graft_x'] !== '') {
          let x = d['mid_graft_x'] + d.size * mag_size * 1.4;
          let y = d['mid_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_mid_sten_pct != 'undefined' &&
          d.graft_mid_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      // .attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Mid Lesion in  T-Graft From: ' + d.proximal_site;
      });

    let t_graft_mid_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 25 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_mid_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', d => {
        return d['mid_graft_x'];
      })
      .attr('y', d => {
        return d['mid_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_mid_sten_pct != 'undefined' &&
          d.graft_mid_sten_pct
        ) {
          return d.graft_mid_sten_pct + ' ' + '%';
        }
      });

    ////////distal ///////////////
    let t_graft_lesion_distal_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 15)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.4)

      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_dist_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_dist_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['distal_graft_x'] !== '') {
          let x = d['distal_graft_x'] + d.size * mag_size * 1.4;
          let y = d['distal_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.5)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_dist_sten_pct != 'undefined' &&
          d.graft_dist_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      //.attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Distal  Lesion in  T-Graft From: ' + d.proximal_site;
      });

    let t_graft_distal_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 25 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_dist_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', d => {
        return d['distal_graft_x'];
      })
      .attr('y', d => {
        return d['distal_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_dist_sten_pct != 'undefined' &&
          d.graft_dist_sten_pct
        ) {
          return d.graft_dist_sten_pct + ' ' + '%';
        }
      });

    ////////t_graft dist_anast_lesion////////////

    let t_graft_lesion_distal_anast_drop = graft_lesion_group_enter
      .append('circle')
      .attr('cx', 15)
      .attr('cy', 10)
      .attr('r', d => d.size * mag_size * 0.4)

      .style('stroke-width', 1)
      .style('stroke', d => {
        let position = d.graft_dist_anast_sten_pct;
        let stroke = this.utility.graft_lesion_stroke(position);
        return stroke;
      })
      .style('fill', d => {
        let position = d.graft_dist_anast_sten_pct;
        let fill = this.utility.graft_lesion_fill(position);
        return fill;
      })
      .attr('transform', (d, i) => {
        if (d['distal_anast_graft_x'] !== '') {
          let x = d['distal_anast_graft_x'] + d.size * mag_size * 1.4;
          let y = d['distal_anast_graft_y'];
          let rotate = 90;
          return (
            'translate(' + x + ',' + y + ')scale(1.1)rotate(' + rotate + ')'
          );
        }
      })
      .attr("opacity", d => {
        if (
          typeof d.graft_dist_anast_sten_pct != 'undefined' &&
          d.graft_dist_anast_sten_pct
        ) {
          return 0.7;
        } else {
          return 0;
        }
      })
      // .attr('opacity', d => 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return (
          ' Distal Anastomotic  Lesion in  T-Graft From: ' + d.proximal_site
        );
      });

    let t_graft_distal_anast_lesion_pct_text = graft_lesion_group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 25 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.graft_dist_anast_sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', d => {
        return d['distal_anast_graft_x'];
      })
      .attr('y', d => {
        return d['distal_anast_graft_y'];
      })
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .text(d => {
        if (
          typeof d.graft_dist_anast_sten_pct != 'undefined' &&
          d.graft_dist_anast_sten_pct
        ) {
          return d.graft_dist_anast_sten_pct + ' ' + '%';
        }
      });

    ////////t_graft dist_anast_lesion////////////

    let on_t_graft_lesion_click = graft_lesion_group_enter.on(
      'click',
      d => {
        d3.select('#' + d['t_graft_lesion_group_enter'])
          //d3.select(this)
          .transition() // apply a transition
          .duration(4000) // apply it over 4000 milliseconds
          .attr('cx', 920);
        /*
                          d3.select(this)
                          .transition()
                          .duration(5500)
                          .ease("elastic")
                          .attr("stroke-width", (d) =>  { return d.size * 2 })
                          .style("stroke", "white")
                          .attr("transform", (d, i) => {
                          return "translate(" + 0 + "," + 50 * i * 2 + ")scale(2)rotate(5)"
                          }//transf
                          )//transform
                        */
      }, //let
    ); //onclick
    //////////////////////
  } //set_t_graft_lesions

  //////////////
} //clas Draw_t_grafts_lesions

/***********************************/

class Draw_t_grafts {
  constructor() {
    this.utility = new Utility();
  } //constructor

  show_t_grafts(bullets_group) {
    let graft_data = get_draw_t_grafts_template();
    let graft_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'graft_group')
      .data(graft_data);

    let graft_group_enter = graft_group
      .enter()
      .append('g')
      .attr('id', 'graft_group_enter');

    let t_graft_graft_paths = graft_group_enter
      .append('path')
      .attr('id', d => {
        return d['cath_graft_prox_site'] + '_' + 't_graft_paths';
      })
      .attr('d', d => {
        let graft_path = d.graft_path;
        if (graft_path !== '') {
          return d.graft_path;
        }
      })
      .attr('stroke-width', d => {
        return d.size * mag_size * 0.6;
      })
      .style('stroke', 'url(#vessel_gradient)')
      .style('fill', 'none')
      .style('stroke-linecap', 'round')
      .style('stroke-join', 'bevel')
      .attr('opacity', d => 0.6)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return (
          ' Graft From: ' +
          d.proximal_site +
          ' To: ' +
          d.cath_graft_segments_cdisc +
          ' Type: ' +
          d.cath_graft_conduit_type
        );
      });

    let t_graft_over = graft_group_enter.on('mouseover', d => {
      d3.select('#' + d['cath_graft_prox_site'] + '_' + 't_graft_paths')
        .transition()
        .duration(2500)
        .attr('opacity', d => 0.9)
        .attr('stroke-width', d => d.size * mag_size * 0.8)
        .style('stroke', 'url(#symbol_gradient)')
        .attr('cursor', 'pointer');
      //.scale((d) => { return d.size * mag_size * 0.8 });
    });

    let t_graft_out = graft_group_enter.on('mouseout', d => {
      d3.select('#' + d['cath_graft_prox_site'] + '_' + 't_graft_paths')
        .transition()
        .attr('opacity', d => 0.6)
        .duration(500)
        .attr('stroke-width', d => d.size * mag_size * 0.6)
        .style('stroke', 'url(#vessel_gradient)')
        .attr('cursor', 'default');
    });
  } //show_t_grafts
  //////////////
  show_t_graft_segments(bullets_group) {
    let c10 = d3.scaleOrdinal(d3.schemeCategory10);

    let graft_data = get_draw_t_grafts_template();
    let graft_group = bullets_group
      .append('g')
      .selectAll('g')
      .attr('id', 'graft_group')
      .data(graft_data);

    let graft_group_enter = graft_group
      .enter()
      .append('g')
      .attr('id', 'graft_group_enter');

    ///////////////////////
    let t_graft_ostial_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.ostial_graft_x;
      })
      .attr('cy', d => {
        return d.ostial_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.7;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', "none")
      .attr('stroke', c10(1))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 1.5;
      })
      .attr('opacity', 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Ostial T-Graft  Segement';
      });

    //////////////////////////////////
    let t_graft_prox_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.proximal_graft_x;
      })
      .attr('cy', d => {
        return d.proximal_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.6;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(2))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' T-Graft Segment: Start of PROXIMAL 1/3 of Graft Lenght';
      });

    //////////////////////////////////
    let mid_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.mid_graft_x;
      })
      .attr('cy', d => {
        return d.mid_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.5;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(3))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' T-Graft Segment: Start of MID 1/3 of Graft Lenght';
      });

    //////////////////////////////////
    let t_graft_distal_mark = graft_group_enter
      .append('ellipse')
      .attr('id', d => {
        'distal_mark' + '_' + d.id;
      })
      .attr('cx', d => {
        return d.distal_graft_x;
      })
      .attr('cy', d => {
        return d.distal_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.5;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(4))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Graft Segment: Start of DISTAL 1/3 of Graft Lenght';
      });

    let t_graft_distal_mark_over = graft_group_enter.on('mouseover', d => {

      //d3.select(this)
      d3.select('#' + 'distal_mark' + '_' + d.id)
        .transition()
        .attr("stroke-width", 120)
        .duration(1500)
        //.attr('stroke-width', d => d.size * mag_size * 11.8)
        .style('stroke', '#d01c8b')
        .style("fill", '#d01c8b')
        .attr('cursor', 'pointer');


    });

    //////////////////////////////////
    let t_graft_distal_anast_mark = graft_group_enter
      .append('ellipse')
      .attr('cx', d => {
        return d.distal_anast_graft_x;
      })
      .attr('cy', d => {
        return d.distal_anast_graft_y;
      })
      .attr('rx', d => {
        return d.size * mag_size * 2.4;
      })
      .attr('ry', d => {
        return d.size * mag_size * 0.3;
      })
      .attr('fill', 'none')
      .attr('stroke', c10(5))
      .attr('stroke-widh', d => {
        return d.size * mag_size * 0.5;
      })
      .attr('opacity', 0.7)
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' T-Graft Segment: DISTAL Anastomotic POSITION';
      });

    ////////////////////
  } //show_graft_segments

  ///////////////
} //class Draw_t_grafts

////////////////////
class Prepare_grafts_data {
  constructor() {
    this.utility = new Utility();
    this.grafts_db_data = get_db_grafts_data();
    // this.grafts_template = get_grafts_template();
    this.g = new Cor_tree_grafts();

  }
  ////////////////
  set_draw_grafts() {
    let g_template = this.g.set_graph()

    for (let i = 0; i < this.grafts_db_data.length; i++) {
      let grafts_db_data_i = this.grafts_db_data[i];
      let node = grafts_db_data_i['cath_graft_prox_site'].trim();

      let node_exists = g_template.hasNode(node);


      if (node_exists === true) {
        let attributes = g_template.getNodeAttributes(node);

        this.make_draw_grafts_template(grafts_db_data_i, attributes);

      }
    }; //for


  } //set_draw_grafts

  //////////////////////
  /*
  set_draw_grafts_2() {

     let grafts_template_keys = Object.keys(this.grafts_template);
    for (const grafts_template_key of grafts_template_keys) {
      let grafts_template_key_i = this.grafts_template[grafts_template_key];

      for (let i = 0; i < this.grafts_db_data.length; i++) {
        let grafts_db_data_i = this.grafts_db_data[i];



        if (
          grafts_db_data_i['cath_graft_prox_site'].trim() ==
          grafts_template_key_i['cath_graft_prox_site']
        ) {

          this.make_draw_grafts_template(
            grafts_db_data_i,
            grafts_template_key_i,
          );
        } //if
      } //for this.grafts_db_data
    } //for grafts_template_key
  } //set_draw_grafts
*/
  ///////////////////////
  //////to make the actual template for drawing the grafts////////////////
  make_draw_grafts_template(db_data, template) {
    template['cath_graft_segments_cdisc'] =
      db_data['cath_graft_segments_cdisc'];

    template['cath_graft_conduit_type'] = db_data['cath_graft_conduit_type'];

    let ostial_graft_path = template['prox_path'];

    /* Here we have an exeption: The T graft are not from ostial points
               we are going to define in draw_graft_template*/
    if (ostial_graft_path !== '') {
      let ostial_points = this.utility.path_to_points(ostial_graft_path);
      let ostial_p_x = ostial_points.x;
      let ostial_p_y = ostial_points.y;
      template['ostial_graft_x'] = ostial_p_x;
      template['ostial_graft_y'] = ostial_p_y;
    }

    let distal_anast_path = this.utility.find_distal_anast_path(
      db_data['cath_graft_segments_cdisc'],
    );

    template['distal_anast_path'] = distal_anast_path;

    let anast_points = this.utility.path_to_points(distal_anast_path);
    let anast_p_x = anast_points.x;
    let anast_p_y = anast_points.y;
    template['distal_anast_graft_x'] = anast_p_x;
    template['distal_anast_graft_y'] = anast_p_y;
    draw_grafts_template.push(template);
  } // make_draw_grafts_template
  ////////////
} //class Prepare_grafts_data
/***********************************/

class Prepare_t_grafts_data {
  constructor() {
    this.utility = new Utility();
    this.grafts_db_data = get_db_grafts_data();
    this.grafts_template = get_grafts_template();
    this.t_grafts_template = get_t_grafts_template();

    this.calc = new Calc_paths();
  } //constructor

  set_draw_t_grafts() {
    /*Constructs the acctual structure (array) to draw the t_grafts */
    let t_keys = Object.keys(this.t_grafts_template);
    for (const t_key of t_keys) {
      let t_key_i = this.t_grafts_template[t_key];


      for (let i = 0; i < this.grafts_db_data.length; i++) {
        let db_data_i = this.grafts_db_data[i];

        if (
          db_data_i['cath_graft_prox_site'].trim() ==
          t_key_i['cath_graft_prox_site']
        ) {
          this.make_draw_t_grafts_template(db_data_i, t_key_i);
        } //if
      } //for i
    } //for const t_key
  } //set_draw_t_grafts

  make_draw_t_grafts_template(db_data, template) {
    template['cath_graft_segments_cdisc'] =
      db_data['cath_graft_segments_cdisc'];

    let distal_seg_name = template['cath_graft_segments_cdisc'];
    let parent_graft = template['graft'];

    let graft_id = template['cath_graft_prox_site'];

    template['cath_graft_conduit_type'] = db_data['cath_graft_conduit_type'];
    template['graft_ostial_sten_pct'] = db_data['graft_ostial_sten_pct'];
    template['graft_prox_sten_pct'] = db_data['graft_prox_sten_pct'];
    template['graft_mid_sten_pct'] = db_data['graft_mid_sten_pct'];
    template['graft_dist_sten_pct'] = db_data['graft_dist_sten_pct'];
    template['graft_dist_anast_sten_pct'] = db_data['graft_dist_anast_sten_pct'];

    let distal_path = this.utility.find_distal_anast_path(distal_seg_name);

    let proximal_path = this.find_proximal_t_graft_path(parent_graft);



    if (typeof proximal_path == 'undefined' && proximal_path) {
      this.utility.message(' A T-graft Origin is not Correct ');
      alert('No Parent Graft. T grafts is not going to be draw ');
    } //if

    let proximal_points = this.utility.path_to_points(proximal_path);
    let distal_points = this.utility.path_to_points(distal_path);


    let t_graft_points = this.calc.build_t_graft_points(
      template,
      graft_id,
      proximal_path,
      distal_path,
    );


    ///////////
    let line = d3
      .line()
      .x(d => {
        return d.x;
      })
      .y(d => {
        return d.y;
      })
      //.curve(d3.curveCatmullRom.alpha(0.9));
      // .curve(d3.curveBundle)
      //            .curve(d3.curveCardinal)
      //            .curve(d3.curveMonotoneY);
      .curve(d3.curveNatural);

    let t_graft_path = line(t_graft_points);
    template['graft_path'] = t_graft_path;
    draw_t_grafts_template.push(template);
  } //;//make_draw_t_grafts_template

  find_proximal_t_graft_path(cor_segment) {

    let draw_grafts_template = get_draw_grafts_template();



    for (let i = 0; i < draw_grafts_template.length; i++) {
      if (draw_grafts_template[i]['cath_graft_prox_site'] == cor_segment) {
        return draw_grafts_template[i]['t_graft_origin_path'];
      } //if
    } //for
  } //find_proximal_t_graft_path


  find_proximal_t_graft_path_2(cor_segment) {
    let draw_grafts_template = get_draw_grafts_template();
    for (let i = 0; i < draw_grafts_template.length; i++) {
      if (draw_grafts_template[i]['cath_graft_prox_site'] == cor_segment) {
        return draw_grafts_template[i]['t_graft_origin_path'];
      } //if
    } //for
  } //find_proximal_t_graft_path

  /////////////////////
} //end class Prepare_t_grafts_data
/***********************************/
class Test_graft_graph {
  constructor() {
    this.g = new Cor_tree_grafts();
  }
  ////////
  start() {

    let graph = this.g.set_graph();

    let all_nodes = graph.nodes();


    //////////
  }; //start
}; //class Test_graft_graph
/////////////////
class Test_graph {
  constructor() {
    this.g = new Cor_tree_graph();
  } //constructor

  start() {
    let graph = this.g.set_graph();

    let all_nodes = graph.nodes();
    let all_edges = graph.edges();

    //const paths = shortestPath(graph, 'lcx_ostium');
    // console.log('shortest_paths: ++++++++++++: ' + JSON.stringify(paths));

    // let components = dijkstra.bidirectional(graph, 'lcx_ostium', 'lcx_mid');
    // console.log('components: ++++++++++++: ' + components);
    let neighbors = graph.neighbors('lm_ostium_rcs_course_pa_ao');
    //console.log("nEIG: "+ neighbors)
    //console.log("Graph type: "+ graph.type)

    this.g = new Cor_tree_graph();
    let nodes = new Array();
    for (const [
      source,
      target,
      sourceAttributes,
      targetAttributes,
      edge,
      edgeAttributes,
    ] of graph.adjacency()) {
      let p_c = {
        parent: source,
        children: target,
      };
      nodes.push(p_c);
    } //of graph

  } //start
} //class Test_graph
///////////
class Test_polygons {
  constructor() {
    this.utility = new Utility();
  }

  test(group) {
    let data = get_draw_n_template();
    let test_group = group
      .append('g')
      .selectAll('g')
      .attr('id', 'symbol_group')
      .data(data);

    let group_enter = test_group
      .enter()
      .append('g')
      .attr('id', 'symbol_group_enter');

    let rca_bullet = group_enter
      .append('circle')
      .attr('cx', d => {
        let data_path = d['path'];
        let data_poly = this.utility.path_to_points(data_path);
        return data_poly['x'];
      })
      .attr('cy', d => {
        let data_path = d['path'];
        let data_poly = this.utility.path_to_points(data_path);
        return data_poly['y'];
      })
      .attr('r', 5.0)
      .style('stroke-width', 10)
      .style('stroke', 'url(#stent_gradient)')
      .style('fill', 'url(#arterial_gradient)');
  } //test
} //class

/***************************************/
class Main_tree {
  constructor(vis) {

    this.vis = vis;
    //////init class ///////////////
    this.guides = new Guides();
    this.utility = new Utility();
    let bullets_group = this.guides.make_bullets(this.vis);


    /*********FOR NATIVE CORONARY TREE*************/
    let prep_natives_data = new Prepare_natives_data();

    let draw_natives = new Draw_natives(this.d3);

    let lesions = new Native_lesions(this.d3);
    ///Please do not change the order of execusion////////
    let draw_lesion_template = prep_natives_data.make_draw_natives_template();
    let set_lesion_stenosis = prep_natives_data.set_lesions();
    let set_graph_x_y = prep_natives_data.set_graph_x_y();

    draw_natives.make(bullets_group);
    lesions.draw_lesions(bullets_group);
    ///////////////////////////////////



    /* ************** Plain Grafts ************/
    let prep_grafts_data = new Prepare_grafts_data();
    let set_draw_grafts = prep_grafts_data.set_draw_grafts();
    let draw_grafts = new Draw_grafts();
    draw_grafts.show_grafts(bullets_group);
    draw_grafts.show_graft_segments(bullets_group);
    draw_grafts.show_graft_lesions(bullets_group);

    /**********T-Grafts *************/
    let prep_t_grafts_data = new Prepare_t_grafts_data();
    prep_t_grafts_data.set_draw_t_grafts();
    let draw_t_grafts = new Draw_t_grafts();
    draw_t_grafts.show_t_grafts(bullets_group);
    draw_t_grafts.show_t_graft_segments(bullets_group);
    let draw_t_grafts_lesions = new Draw_t_grafts_lesions();
    draw_t_grafts_lesions.show_t_graft_lesions(bullets_group);

    /************** APPEND SYMBOLS ***********/
    // this.utility.draw_side_symbols(bullets_group)
    let prep_symbols_data = new Prepare_symbols_data();
    prep_symbols_data.set_data();

    let append_symbols = new Append_symbols(this.d3);
    append_symbols.append_draw_symbol(bullets_group);

    //let test_polygons = new Test_polygons()
    //test_polygons.test(bullets_group);

    // let test_graph = new Test_graph();
    // test_graph.start();
    // let test_graph = new Test_graft_graph();
    // test_graph.start();

    /*****Collaters****************/
    let collateral = new Prepare_collaterals_data();
    collateral.make_col_paths();
    collateral.draw_collaterals(bullets_group);

    /*********** lv_model Bull's Eye ***************/
    let lv_model = new LvSegModel(d3);
    lv_model.make_rings(bullets_group);
    //////////FOR DENDROGRAM///////////////////////
    /*
    let draw_n_template =   get_draw_n_template();
    let draw_graft_template = get_draw_grafts_template()
    let cor_dendrogram = new Cor_dendrogram(bullets_group,
        draw_n_template,
        draw_graft_template
    );
    //cor_les_chronic_total_yn,
    */
    ///////////////////////
    this.utility.message(
      'Visualization Of Coronary Angio. Is Only a Sketh... ',
    );
    //this.utility.show_xy();

  }

  /////////////////////
} //class Main_tree
////////////////
class Append_symbols {
  constructor(d3) {
    this.d3 = d3;
    this.utility = new Utility();
  } //constructor

  append_draw_symbol(group) {
    let c10 = d3.scaleOrdinal(d3.schemeCategory10);

    let symbol_data = get_draw_symbols_template();

    //this.utility.test_use(group);

    let symbol_group = group
      .append('g')
      .selectAll('g')
      .attr('id', 'symbol_group')
      .data(symbol_data);

    let symbol_group_enter = symbol_group
      .enter()
      .append('g')
      .attr('id', 'symbol_group_enter');
    /*********************
                SYMBOL TEST
    symbolTypes = ['symbolCircle',
 'symbolCross',
 'symbolDiamond',
 'symbolSquare',
 'symbolStar',
 'symbolTriangle',
 'symbolWye'];


      *************************/
    /*
      let symbolGenerator = d3
      .symbol()
      .type(d3.symbolTriangle)
      .size(80);
    let path_symbol = symbolGenerator();

    let symbol_test = group_enter
      .append('path')
      .attr('id', d => this.dom + '_' + d.id)
      .attr('class', (d, i) => 'native')
      .attr('d', d => {
        console.log('path_triangle: ' + path_symbol);
        return path_symbol;
      })
      .attr('stroke-width', d => {
        return 10;
      })
      .style('stroke', 'yellow')
      .style('stroke-linecap', 'round')
      .style('stroke-join', 'round')
      .style('fill', 'none')
      .attr('opacity', d => 0.9);
      */

    ////////////////////
    let symbols_paths = symbol_group_enter
      .append('path')
      .attr('id', d => {
        return 'symbols_paths' + '_' + d.id;
      })
      .attr('cursor', 'pointer')
      .attr('d', d => {
        let path = d.path;
        return path;
      })
      .attr('stroke-width', d => d.size * mag_size * 0.8)
      .style('stroke', 'yellow')
      .style('fill', 'white')
      // .style('fill', 'url(#symbol_gradient)')
      .attr('opacity', d => 0.7)
      //.attr("transform", d => d.lesion_x >= Math.PI ? "rotate(180)" : null)
      .attr('transform', (d, i) => {
        if (d.lesion_x !== '') {
          let x = d.lesion_x - 6 * i * 1.4;
          let y = d.lesion_y + 5;
          return 'translate(' + x + ',' + y + ')scale(0.9)rotate(5)';
        }
      })
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Symbol For : ' + d.description + ' In ' + d.id;
      });




    /////////////////////
  } //draw_symbol
  //////////////////////////
} //class Append_symbols

//////////////////////

class Utility {
  constructor() {
    this.g = new Cor_tree_graph();
    this.graph = this.g.set_graph();
  }
  /*
     *
     *
function wrap(text) {
    text.each(function() {
      var text = d3.select(this);
      var lines = text.text().split(/\n/);

      var y = text.attr('y');
      var x = text.attr('x');
      var dy = parseFloat(text.attr('dy'));

      text
        .text(null)
        .append('tspan')
        .attr('x', x)
        .attr('y', y)
        .attr('dy', dy + 'em')
        .text(lines[0]);

      for (var lineNum = 1; lineNum < lines.length; lineNum++) {
        text
          .append('tspan')
          .attr('x', x)
          .attr('y', y)
          .attr('dy', lineNum * 1.1 + dy + 'em')
          .text(lines[lineNum]);
      }
    });
  }
     */
  /*********************************** */

  /*
  graft_lesion_pct_text(group_enter,  x,  y,  sten_pct){

   let text =    group_enter
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 25 + 'px')
      .attr('fill', d => {
        let pct = parseInt(d.sten_pct, 10);
        if (pct > 50) {
          return '#fff';
        } else {
          return '#939393 ';
        }
      })
      .attr('x', x)
      .attr('y', y)
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.7')
      .style('stroke', 'none')
      .attr('cursor', 'pointer')
      .text(d => {
        if (
          typeof sten_pct != 'undefined' &&
          sten_pct
        ) {
          return sten_pct + ' ' + '%';
        }
      });
  return text;

    };//graft_lesion_pct_text
  */
  /*********************************** */
  show_rain_drop(r) {
    let drop =
      'M' +
      r +
      ',0' +
      'A' +
      r +
      ',' +
      r +
      ' 0 1,1 ' +
      -r +
      ',0' +
      'C' +
      -r +
      ',' +
      -r +
      ' 0,' +
      -r +
      ' 0,' +
      -3 * r +
      'C0,' +
      -r +
      ' ' +
      r +
      ',' +
      -r +
      ' ' +
      r +
      ',0' +
      'Z';

    return drop;
  }

  make_polygon(sides, size, radius, center) {
    let circle = 2 * Math.PI;
    let angle = circle / sides;
    let points = [];

    for (i in [(0).sides - 1]) {
      x = Math.cos(angle * i) * size + center[0];
      y = Math.sin(angle * i) * size + center[1];
      points[i] = {
        x: x,
        y: y,
        r: radius,
      };
    }
    return points;
  } //make_polygon
  /////////////////
  make_circle_xy(angle, radius) {
    // call as:  defs_rect_xy = utility.make_circle_xy(-90,16)
    //.attr("x",   defs_rect_xy.x )
    // .attr("y", defs_rect_xy.y)

    let points = [];

    let x = Math.cos(angle) * radius;
    let y = Math.sin(angle) * radius;
    points = {
      x: x,
      y: y,
    };

    return points;
  } //make_circle_xy
  /////////////////
  circumference_point(center_x, center_y, radius) {
    let t = 90;
    let point = [];
    let x_calc = (radius * Math.cos(t)) + center_x;

    let y_calc = (radius * Math.sin(t)) + center_y;

    point.push({
      x: x_calc,
      y: y_calc
    })

    return point[0];

  }
  //////////////////////
  find_distal_anast_path(cor_segment) {

    let attr_segment = this.graph.getNodeAttributes(cor_segment);

    let lesion_path = attr_segment['lesion_path'];

    return lesion_path;
  } //find_distal_anast_path

  graft_lesion_stroke(position) {
    if (typeof position != 'undefined' && position) {
      return "red";
      // return 'url(#stent_gradient)';
    } //if
  } //end graft_lesion_fill

  graft_lesion_fill(position) {
    if (typeof position != 'undefined' && position) {
      return 'url(#symbol_gradient)';
    } //if
  } //end graft_lesion_fill

  ///////////
  test_use(group) {
    let info_rect = group
      .append('svg:rect')
      .attr('id', 'axis_info_rect')
      .attr('width', 7)
      .attr('height', 7)
      .attr('rx', 1.5)
      .attr('ry', 1.5)
      .style('cursor', 'pointer')
      .style('opacity', 1);

    ///////////////
    //let defs_rect_xy = this.circle_xy(-90,16)
    let defs_rect_xy = this.circle_xy(-135, 16);

    let defs_rect = group
      .append('use')
      .attr('xlink:href', '#axis_info_rect')
      .attr('id', 'defs_rect')
      .attr('x', defs_rect_xy.x)
      .attr('y', defs_rect_xy.y)
      .style('stroke', '#417DC1')
      .style('fill', 'url(#symbol_gradient)');
  }

  circle_xy(angle, radius) {
    let points = [];

    let x = Math.cos(angle) * radius;
    let y = Math.sin(angle) * radius;
    points = {
      x: x,
      y: y,
    };

    return points;
  } //end circle_xy

  lesion_text(group, text) {
    group
      .append('text')
      .attr('dx', 15 + 'px')
      .attr('dy', 15 + 'px')
      .attr('fill', 'white')
      .attr('text-anchor', 'start')
      .style("font-family", "sans, georgia, times")
      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.75')
      .style('stroke', 'none')
      .text(d => {
        return text + ' ' + '%';
      });
  }

  build_grid(group) {
    let grid = new Background_grid(this.d3);
    grid.set_grid(group);
    //////////////////////
  }

  path_to_points(path) {
    if (path != '') {
      let str_path = path.toString();
      let a_path = {
        type: 'path',
        d: str_path,
      };
      let points = toPoints(a_path);
      let points_0 = points[0];
      return {
        x: points_0.x,
        y: points_0.y,
      };
    }
  } //path_to_points

  path_to_all_points(path) {
    let str_path = path.toString();
    let a_path = {
      type: 'path',
      d: str_path,
    };
    let points = toPoints(a_path);
    return points;

  } //path_to_all_points

  draw_side_symbols(group) {
    this.symbols = get_symbols();
    const start_y = 10;
    const start_x = 10;
    const height = 70;
    const width = 50;
    const step = 70;

    let transform_to = () => {
      return 'translate(' + 10 + ',' + 100 + ') scale(' + 1 + ')';
    };

    let rect_g = group.append('g').attr('transform', 'translate(800, -30)');

    let symbols_group = rect_g
      .append('g')
      .selectAll('g')
      .attr('id', 'symbols_group_g')
      .data(symbols);

    let symbols_group_enter = symbols_group
      .enter()
      .append('g')
      .attr('id', 'symbols_group_enter');

    let symbols_paths = symbols_group_enter
      .append('path')
      .attr('id', d => 'symbols' + '_' + d.id)
      .attr('class', (d, i) => 'symbols')
      .attr('cursor', 'pointer')
      .attr('d', d => {
        let path = d.path;
        return path;
      })
      .attr('stroke-width', d => d.size * mag_size * 1.2)
      .style('stroke', 'white')
      .style('fill', 'none')
      .attr('opacity', d => 0.9)
      //.attr("transform", transform_to())
      .attr('transform', (d, i) => {
        return 'translate(' + 0 + ',' + 50 * i * 2 + ')scale(2)rotate(5)';
      })
      .attr('cursor', 'pointer')
      .append('title')
      .text(d => {
        return ' Symbol: ' + d.description_name;
      });

    let over = symbols_group_enter.on('mouseover', d => {
      d3.select('#' + 'symbols' + '_' + d.id)
        .transition()
        .duration(1500)
        .attr('stroke-width', d => d.size * mag_size * 4)
        //  .attr("transform", (d, i) => {
        //   return "translate(" + 0 + "," + 0 + ")scale(4)rotate(45)"
        //.attr("transform", tranform_to())
        //.attr("transform", (d, i) => {
        //return "translate(" + 0 + "," + 0 + ")scale(2)rotate(90)"
        // })
        //  .style("stroke", "#d01c8b")
        .style('stroke', '#D6FF5C')
        .attr('cursor', 'pointer');
    });

    let out = symbols_group_enter.on('mouseout', d => {
      d3.select('#' + 'symbols' + '_' + d.id)
        .transition()
        .duration(500)
        // .attr("transform", (d, i) => {
        //    return "translate(" + 0 + "," + 0 + ")scale(1)rotate(0)"
        // })

        .attr('stroke-width', d => d.size * mag_size * 2)
        .style('stroke', 'url(#symbol_gradient)')
        .attr('cursor', 'default');
    });
  }

  show_xy() {
    let x = null;
    var y = null;

    let coordinates = d3.mouse(this);
    x = coordinates[0];
    y = coordinates[1];


  } //show_x_y

  ///////////////////
  message(a_text) {
    this.d3 = d3;

    let group_i = this.d3.select('.info_message');
    let remove_text = this.d3.select("#info_text_draw_text")
    remove_text.remove();

    let area_g = group_i.append('g');
    //area_g.remove();

    area_g
      .append('text')
      .attr('x', 30) // set x position of left side of text
      .attr('y', 10) // set y position of bottom of text
      .attr('dy', '.35em') // set offset y position
      .attr('id', 'info_text_draw_text')
      .attr('text-anchor', 'middle') // set anchor justification
      .style('font-size', '0.95em')
      .style('font-weight', 'normal')
      .style('fill', '#000')
      .attr('transform', 'rotate(0)')
      .text(a_text);
    /* .transition()
      .duration(12000)
      .style('opacity', 0.9)
      .duration(4000)
      .style('opacity', 0.6)
      .duration(2000)
      .style('opacity', 0.3)
      .duration(3000)
      .remove(this);
      */
  } //message

  ////////////////////
  show_rain_drop(r) {
    let drop =
      'M' +
      r +
      ',0' +
      'A' +
      r +
      ',' +
      r +
      ' 0 1,1 ' +
      -r +
      ',0' +
      'C' +
      -r +
      ',' +
      -r +
      ' 0,' +
      -r +
      ' 0,' +
      -3 * r +
      'C0,' +
      -r +
      ' ' +
      r +
      ',' +
      -r +
      ' ' +
      r +
      ',0' +
      'Z';

    return drop;
  }
  ////////////////////////
  update_gg_graph(graph) {
    let graft2draw = get_draw_grafts_template()



    for (let i = 0; i < this.graft2draw.length; i++) {
      let data_i = this.graft2draw[i];
      let data_i_id = data_i["cath_graft_prox_site"]

      for (let prop in data_i) {
        if (prop !== "") {

          graph.setNodeAttribute(data_i_id,
            prop,
            data_i[prop]);
        }
      }; //for prop

    }; //for i


    return graph;


    /////////////////////

  }; //update_gg_graph

  //////////////////////////
} //class Utility
///////////////////////
class Marker_2 {
  constructor() { }

  present() {

    let marker = d3.select("svg").append('defs')
      .append('marker')
      .attr("id", "Triangle")
      .attr("refX", 12)
      .attr("refY", 6)
      .attr("markerUnits", 'userSpaceOnUse')
      .attr("markerWidth", 12)
      .attr("markerHeight", 18)
      .attr("orient", 'auto')
      .append('path')
      .attr("d", 'M 0 0 12 6 0 12 3 6');
    //
    //d3.selectAll("line").attr("marker-end", "url(#Triangle)")
  }; //present
}
///////////////
class Marker {
  make(group) {
    let utility = new Utility();

    let marker_def = group.append('defs');

    marker_def
      .append('svg:marker')
      .attr('id', 'marker_arrow')
      .attr('viewBox', '-6 -6 12 12')
      .attr('refX', 0)
      .attr('refY', 0)
      .attr('markerWidth', 5)
      .attr('markerHeight', 5)
      .attr('markerUnits', 'strokeWidth')
      .attr('orient', 'auto')
      .append('polygon')
      .attr('points', '-2,0 -5,5 5,0 -5,-5')
      .style('fill', 'red')
      .style('stroke', 'yellow')
      .style('stroke-width', 1)
      .style('opacity', 0.5);

    group
      .append('polyline')
      //.attr('points', '0,0 50,-10 200,-10')
      .attr('points', '100,-10,50,-10,0,0')
      .attr('stroke-width', 2.0)
      .attr('stroke', 'yellow')
      .attr('fill', 'none')
      .attr('marker-end', 'url(#marker_arrow)')
      .attr('marker-start', 'url(#marker_arrow)');

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
class Guides {
  constructor() {
    this.utility = new Utility();
    this.property = new Segment_property(d3);
    this.native_data = new Prepare_natives_data();
  }

  make_bullets(svg) {
    let margin = {
      top: 30,
      right: 20,
      bottom: 30,
      left: 50,
    },
      width = 1100 - margin.left - margin.right,
      height = 1300 - margin.top - margin.bottom;

    let start_x = 25;
    let start_y = 25;

    let rca_ostium_x = 290.625 - 15;
    let rca_ostium_y = 461.73721 + 12.5;
    let lm_ostium_x = 290.625 + 15;
    let lm_ostium_y = 461.73721 - 12.5;

    /*
              let  rca_ostium_x=  304.6875 ;
              let rca_ostium_y=  536.73721;
              let  lm_ostium_x=   368.30218;
              let  lm_ostium_y=  504.55492;
            */



    let rect1 = svg.append('rect')
      .attr('id', 'frame_element')
      .attr('class', 'frame_element_grid')
      .attr('x', start_x)
      .attr('y', start_y)
      .attr('rx', 12.5)
      .attr('ry', 12.5)
      .attr('width', width)
      .attr('height', height)
      .attr('stroke-width', 15)
      .style('stroke', 'url(#frame_gradient)');
    //.style('stroke', '#b2beb5');

    let rect2 = svg
      .append('rect')
      .attr('id', 'frame_element')
      .attr('x', start_x + 10)
      .attr('y', start_y + 10)
      .attr('rx', 6.125)
      .attr('ry', 6.125)
      .attr('width', width - 20)
      .attr('height', height - 20)
      .attr('stroke-width', 12)
      .style("stroke", "#8b8589");
    //.style('stroke', 'url(#frame_gradient)');

    let rect3 = svg
      .append('rect')
      .attr('id', 'frame_element')
      .attr('x', start_x + 20)
      .attr('y', start_y + 20)
      .attr('rx', 3.63)
      .attr('ry', 3.63)
      .attr('width', width - 40)
      .attr('height', height - 40)
      .attr('stroke-width', 7)
      .style("stroke", "#636363");
    // .style('stroke', 'url(#frame_gradient)');

    // this.utility.build_grid(svg);

    let bullets_group = svg
      .append('g')
      .attr('transform', 'translate(150, 150)');

    let bullets_color = this.property.color_gradient(bullets_group);
    /*
        let rca_bullet = bullets_group
          .append('circle')
          .attr('cx', rca_ostium_x)
          .attr('cy', rca_ostium_y)
          .attr('r', 5.0)
          .style('stroke-width', 1)
          .style('stroke', 'url(#stent_gradient)')
          .style('fill', 'url(#arterial_gradient)');

        let lm_bullet = bullets_group
          .append('circle')
          .attr('cx', lm_ostium_x)
          .attr('cy', lm_ostium_y)
          .attr('r', 5.0)
          .style('stroke-width', 1)
          .style('stroke', 'url(#stent_gradient)')
          .style('fill', 'url(#vessel_gradient)');
    */
    //let dominance = this.native_data.get_db_dominance();
    let dominance = get_db_dominance();
    /*--------------------------------*/
    let text = svg
      .append('text')
      .attr('dx', start_x + 475 + 'px')
      .attr('dy', start_y + 70 + 'px')
      .attr('fill', 'url(#frame_gradient)')
      .attr('text-anchor', 'middle')
      .style("font-family", "sans, georgia, times")

      .style('font-size', '1.2em')
      .style('font-weight', 'normal')
      .style('opacity', '0.9')
      .style('stroke', 'none')
      .text(
        ' 2D Coronary Sketch. Segments as per CDISC. '
      );
    let db_data = get_db_data();

    let info_cor_date = db_data["info_coronary"]["info_cor_date"]
    let info_exam_num = db_data["info_coronary"]["info_exam_num"]
    let icd10cm_code_1 = db_data["info_coronary"]["icd10cm_code_1"]


    let text_2 = svg
      .append('text')
      .attr('dx', start_x + 475 + 'px')
      .attr('dy', start_y + 90 + 'px')
      // .attr('fill', 'url(#frame_gradient)')
      .attr('fill', '#dbd7d2')
      .attr('text-anchor', 'middle')
      .style("font-family", "sans, georgia, times")

      .style('font-size', '0.85em')
      .style('font-weight', 'normal')
      .style('opacity', '0.9')
      .style('stroke', 'none')
      .text(
        ' Exam Date:  ' +
        info_cor_date +
        " Lab Number: " +
        info_exam_num +
        " ICD10-CM: " +
        icd10cm_code_1 +
        ' Dominace: ' +
        dominance.toUpperCase(),
      );

    /*
      let  fill_color = d3.scaleLinear()
          //.range(colorbrewer.YlGnBu[9])
          .range(diverge_color)
          .domain([0,9]);

          let fill_color = d3
      .scaleLinear()
      .domain([0, 10])
      .range(vein_colors);
    //.range(brewer_red);
      //.range(diverge_color);
      ///d3.scale.category20c()

      let rect_5 = svg
      .append('rect')
      .attr('id', 'rect_5')
      .attr('x', start_x + 30)
      .attr('y', start_y + 80)
      .attr('rx', 6.125)
      .attr('ry', 6.125)
      .attr('width', width - 60)
      .attr('height', 20)
      .attr('stroke-width', 12)
      .style('stoke', 'none')
      .attr('fill', d => {
        return fill_color
      });
      */

    return bullets_group;
  } //make_bullets
} //class Cuides

/////////////////
class Set_sketch {
  constructor() { }
  svg() {
    let container = d3.select('#draw_info_coronary_canvas');
    let svg = container.append('svg');

    svg.attr('id', 'main_svg');
    svg.attr('class', 'main_svg');
    svg.attr({
      width: '100%',
      height: '100%',
    });
    svg.attr('viewBox', '0 0 ' + 1100 + ' ' + 1300);
    svg.attr('preserveAspectRatio', 'xMidYMid meet');
    svg.attr('pointer-events', 'all');
    svg.style('margin-left', '0%');
    svg.style('margin-right', '0%');
    svg.style('margin-top', '0%');
    svg.style('margin-bottom', '0%');
    svg.style('background-color', '#000');
    svg.style('cursor', 'move');
    svg.style('shape-rendering', 'crispEdges');
    svg.call(this.zoom());

    return svg;
  } //svg

  zoom() {
    let a_zoom = d3.zoom().on('zoom', function () {
      let svg_vis = d3.select('#svg_vis');
      svg_vis.attr('transform', d3.event.transform);
    });
    return a_zoom;
  } //zoom

  vis() {
    let svg_vis = this.svg();
    let vis = svg_vis.append('svg:g').attr('id', 'svg_vis');
    return vis;
  }
} //class Set_sketch
//////////////////////////
class Inkscape2json {
  constructor() {

  }

  load_xml() {
    let my_svg = d3.xml("./cdisc_plain1.svg")


    let my_xml =
      '<?xml version="1.0" encoding="utf-8"?>' +
      '<note importance="high" logged="true">' +
      '    <title>Happy</title>' +
      '    <todo>Work</todo>' +
      '    <todo>Play</todo>' +
      '</note>';
    return my_xml;


  }; //load_xml

  make() {
    let xml = this.load_xml();

    var result1 = convert.xml2json(xml, {
      compact: true,
      spaces: 4
    });
    var result2 = convert.xml2json(xml, {
      compact: false,
      spaces: 4
    });

  }; //convert
  /////////////////
}; //Inkscape2json
/*
selection.exit()
         .transition()
         .attr("cx", function (item, i) { return width })
         .attr("cy", function (item, i) { return height })
         .attr("r", function (item) { return 0 })
         .attr("fill", function (item) { return "#000000" })
         .duration(1000)
         .remove();

*/
const draw_coronary_init = () => {
  // console.log("from draw_coronary_init ------------------------");

  const main = new Interface_buttons();
};

draw_coronary_init();
