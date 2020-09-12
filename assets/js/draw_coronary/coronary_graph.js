/*
import {
    buckets
} from './buckets.min.js';
*/
//var buckets = require("./buckets.min.js");

import {
    natives_template
} from './cor_data.min.js';



import {
    Grafts_template,
    T_grafts_template
} from './grafts_template.min.js';
import {
    graph_edges,
    graph_parents
} from './cor_data.min.js';

var Graph = require('graphology/build/graphology.min.js');



/*
  "cath_graft_prox_site": "innominate",
    "proximal_site": "Innominate Artery",
    "prox_path": "m161.62 371.41l-10.32-16.73",
    "size": "4.8",
    "cath_graft_segments_cdisc": "",
    "distal_anast_path": "",
    "cath_graft_conduit_type": "",
     "graft_path": "",

    "distal_anast_graft_x": "",
    "distal_anast_graft_y": "",

    "graft_prox_sten_yn": "",
    "graft_mid_sten_yn": "",
    "graft_dist_sten_yn": "",
    "graft_dist_anast_sten_yn": "",

   "ostial_graft_x": "",
    "ostial_graft_y": "",
    "mid_graft_x": "",
    "mid_graft_y": "",
    "distal_graft_x": "",
    "distal_graft_y": "",
    "start_path": "",
    "ostial_path": "",
    "proximal_path": "",
    "mid_path": "",
    "distal_path": "",
    "distal_anast_path": "",
   "end_path": "",
   "graft_ostial_sten_pct": "",
    "graft_prox_sten_pct": "",
    "graft_mid_sten_pct": "",
    "graft_dist_sten_pct": "",
   "graft_dist_anast_sten_pct": "",

    "proximal_graft_x": "",
    "proximal_graft_y": "",
    "t_graft_origin_x": "",
    "t_graft_origin_y": "",
    "t_graft_origin_path": "",
    "parent_graft": "",

    * */
export class Cor_tree_grafts {
    construcor() {

    } //contructor
    /////////////////
    set_graph() {
        let grafts_graph = new Graph({
            directed: true,

        });
        for (let i = 0; i < Grafts_template.length; i++) {
            let n_i = Grafts_template[i];
            let cath_graft_prox_site = n_i['cath_graft_prox_site'];

            let a_proximal_site = n_i['proximal_site'];
            let a_prox_path = n_i['prox_path'];
            let a_size = n_i['size'];

            let a_cath_graft_segments_cdisc = n_i['cath_graft_segments_cdisc'];
            let a_cath_graft_conduit_type = n_i['cath_graft_conduit_type'];
            let a_distal_anast_graft_x = n_i['distal_anast_graft_x'];
            let a_distal_anast_graft_y = n_i['distal_anast_graft_y'];

            let a_graft_prox_sten_yn = n_i['graft_prox_sten_yn'];
            let a_graft_mid_sten_yn = n_i['graft_mid_sten_yn'];
            let a_graft_dist_sten_yn = n_i['graft_dist_sten_yn'];
            let a_graft_dist_anast_sten_yn = n_i['graft_dist_anast_sten_yn'];

            let a_ostial_graft_x = n_i['ostial_graft_x'];
            let a_ostial_graft_y = n_i['ostial_graft_y'];
            let a_mid_graft_x = n_i['mid_graft_x'];
            let a_mid_graft_y = n_i['mid_graft_y'];
            let a_distal_graft_x = n_i['distal_graft_x'];
            let a_distal_graft_y = n_i['distal_graft_y'];

            let a_start_path = n_i['start_path'];
            let a_ostial_path = n_i['ostial_path'];
            let a_proximal_path = n_i['proximal_path'];
            let a_mid_path = n_i['mid_path'];
            let a_distal_path = n_i['distal_path'];
            let a_distal_anast_path = n_i['distal_anast_path'];
            let a_end_path = n_i['end_path'];
            let a_graft_ostial_sten_pct = n_i['graft_ostial_sten_pct'];
            let a_graft_prox_sten_pct = n_i['graft_prox_sten_pct'];
            let a_graft_mid_sten_pct = n_i['graft_mid_sten_pct'];
            let a_graft_dist_sten_pct = n_i['graft_dist_sten_pct'];

            let a_proximal_graft_x = n_i['proximal_graft_x'];
            let a_proximal_graft_y = n_i['proximal_graft_y'];
            let a_t_graft_origin_x = n_i['t_graft_origin_x'];
            let a_t_graft_origin_y = n_i['t_graft_origin_y'];
            let a_t_graft_origin_path = n_i['t_graft_origin_path'];
            let a_parent_graft = n_i['parent_graft'];




            let nodes = grafts_graph.addNode(cath_graft_prox_site, {
                cath_graft_prox_site: cath_graft_prox_site,
                proximal_site: a_proximal_site,
                prox_path: a_prox_path,
                size: a_size,
                cath_graft_segments_cdisc: a_cath_graft_segments_cdisc,
                distal_anast_path: a_distal_anast_path,
                cath_graft_conduit_type: a_cath_graft_conduit_type,
                distal_anast_graft_x: a_distal_anast_graft_x,
                distal_anast_graft_y: a_distal_anast_graft_y,

                graft_prox_sten_yn: a_graft_prox_sten_yn,
                graft_mid_sten_yn: a_graft_mid_sten_yn,
                graft_dist_sten_yn: a_graft_dist_sten_yn,
                graft_dist_anast_sten_yn: a_graft_dist_anast_sten_yn,
                ostial_graft_x: a_ostial_graft_x,
                ostial_graft_y: a_ostial_graft_y,
                mid_graft_x: a_mid_graft_x,
                mid_graft_y: a_mid_graft_y,
                distal_graft_x: a_distal_graft_x,
                distal_graft_y: a_distal_graft_y,
                start_path: a_start_path,
                ostial_path: a_ostial_path,
                proximal_path: a_proximal_path,

                mid_path: a_mid_path,
                distal_path: a_distal_path,
                distal_anast_path: a_distal_anast_path,
                end_path: a_end_path,

                graft_ostial_sten_pct: a_graft_ostial_sten_pct,
                graft_prox_sten_pct: a_graft_prox_sten_pct,
                graft_mid_sten_pct: a_graft_mid_sten_pct,
                graft_dist_sten_pct: a_graft_dist_sten_pct,

                proximal_graft_x: a_proximal_graft_x,
                proximal_graft_y: a_proximal_graft_y,
                t_graft_origin_x: a_t_graft_origin_x,
                t_graft_origin_y: a_t_graft_origin_y,
                t_graft_origin_path: a_t_graft_origin_path,
                parent_graft: a_parent_graft,


            });
        } //for natives

        return grafts_graph;
    } //set graph

    ////////////////
} //class

/* *************************** */

export class Cor_tree_graph {
    /////////////
    ///////////////
    set_graph() {
        let g = new Graph({
            multi: false,
            directed: true,
            allowSelfLoops: false,
        

        });

        for (let i = 0; i < natives_template.length; i++) {
            let n_i = natives_template[i];
            let a_id = n_i['id'];
            let a_path = n_i['path'];
            let a_description_name = n_i['description_name'];
            let a_seg_def = n_i['seg_def'];
            let a_cor_les_segments_cdisc = n_i['cor_les_segments_cdisc'];
            let a_lesion_path = n_i['lesion_path'];
            let a_graft_path = n_i['graft_path'];
            let a_stent_path = n_i['stent_path'];
            let a_rca_dom_draw = n_i['rca_dom_draw'];
            let a_lcx_dom_draw = n_i['lcx_dom_draw'];
            let a_balanced_dom_draw = n_i['balanced_dom_draw'];
            let a_vessel_group = n_i['vessel_group'];
            let a_vessel_group_aha = n_i['vessel_group_aha'];
            let a_size = n_i['size'];
            let a_cor_les_pct = n_i['cor_les_pct'];
            let a_lesion_x = n_i['lesion_x'];
            let a_lesion_y = n_i['lesion_y'];
            let a_stent_x = n_i['stent_x'];
            let a_stent_y = n_i['stent_y'];
            let a_graft_x = n_i['graft_x'];
            let a_graft_y = n_i['graft_y'];
            let a_cor_les_prior_treated_yn = n_i['cor_les_prior_treated_yn'];
            let a_cor_les_prior_stent_yn = n_i['cor_les_prior_stent_yn'];
            let a_cor_les_stent_ptc = n_i['cor_les_stent_ptc'];
            let a_default_draw = n_i['default_draw'];
            let a_cor_les_calcium_yn = n_i['cor_les_calcium_yn'];
            let a_visible = n_i['visible'];
            let a_course_benign = n_i['course_benign'];
            let a_course_malignant = n_i['course_malignant'];
            let a_is_variant = n_i['is_variant'];
            let a_is_anomaly = n_i['is_anomaly'];
            let a_lesion_present = n_i['lesion_present'];
            let a_lesion_id = n_i['lesion_id'];
            let a_collateral_points = n_i['collateral_points'];
            let a_cor_les_thrombus_yn = n_i['cor_les_thrombus_yn'];
            let a_irregularities_has = n_i['irregularities_has'];

            let nodes = g.addNode(a_id, {
                id: a_id,
                path: a_path,
                description_name: a_description_name,
                seg_def: a_seg_def,
                cor_les_segments_cdisc: a_cor_les_segments_cdisc,
                lesion_path: a_lesion_path,
                graft_path: a_graft_path,
                stent_path: a_stent_path,
                rca_dom_draw: a_rca_dom_draw,
                lcx_dom_draw: a_lcx_dom_draw,
                balanced_dom_draw: a_balanced_dom_draw,
                vessel_group: a_vessel_group,
                vessel_group_aha: a_vessel_group_aha,
                size: a_size,
                cor_les_pct: a_cor_les_pct,
                lesion_x: a_lesion_x,
                lesion_y: a_lesion_y,
                stent_x: a_stent_x,
                stent_y: a_stent_y,
                graft_x: a_graft_x,
                graft_y: a_graft_y,
                cor_les_prior_treated_yn: a_cor_les_prior_treated_yn,
                cor_les_prior_stent_yn: a_cor_les_prior_stent_yn,
                cor_les_stent_ptc: a_cor_les_stent_ptc,
                default_draw: a_default_draw,
                cor_les_calcium_yn: a_cor_les_calcium_yn,
                visible: a_visible,
                course_benign: a_course_benign,
                course_malignant: a_course_malignant,
                is_variant: a_is_variant,
                is_anomaly: a_is_anomaly,
                lesion_present: a_lesion_present,
                lesion_id: a_lesion_id,
                collateral_points: a_collateral_points,
                cor_les_thrombus_yn: a_cor_les_thrombus_yn,
                irregularities_has: a_irregularities_has,
            });
        } //for natives
        for (let i = 0; i < graph_edges.length; i++) {
            let n_i = graph_edges[i];
            let source = n_i['source'];
            let target = n_i['target'];
            let key = n_i['key'];
            let edge = g.addEdgeWithKey(key, source, target);
        } //for edges

			/*
        let graft_tree = new Cor_tree_grafts()
        let graft_graph = graft_tree.set_graph()

        graft_graph.forEachNode((native, attributes) => {
            let cath_graft_prox_site
                = attributes['cath_graft_prox_site'];
               g.mergeNode(cath_graft_prox_site );
            let merged =   g.mergeNodeAttributes(cath_graft_prox_site, attributes );
        
               console.log('att '+ JSON.stringify(merged));
            
        })

*/


        return g;
    } //set_graph

    ///////////////////////////
    /*
       let all_nodes= g.nodes()
        console.log('all_nodes ' + JSON.stringify(all_nodes));


      // Using the callback methods
graph.forEachEdge(
  (edge, attributes, source, target, sourceAttributes, targetAttributes) => {
    console.log(`Edge from ${source} to ${target}`);
});
 let attributes = graph.getNodeAttributes('lad_mid');
 console.log('attributes ' + JSON.stringify(attributes));

// Want an attribute or attributes?
          graph.getNodeAttribute(node, name);
          graph.getNodeAttributes(node);

        //let all_export = g.export()
        //console.log("export: " + JSON.stringify(all_export))
        g.on('edgeAdded', function ({
            key,
            source,
            target
        }) {
            console.log(key, source, target);
        })
        const edge = graph.addEdge('Martha', 'Catherine', {type: 'KNOWS', weight: 2});

// Using the edge's key:
const attributes = graph.getEdgeAttributes(edge);

// Using the edge's source & target:
graph.getEdgeAttributes('Martha', 'Catherine'


// Want an attribute or attributes?
graph.getNodeAttribute(node, name);
graph.getNodeAttributes(node);

 */
    ///////////////////

    /******************************


***************************
*/
} //class Cor_tree_graph
