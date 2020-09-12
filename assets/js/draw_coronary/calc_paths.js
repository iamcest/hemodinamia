var d3 = require('d3');

export class Calc_paths {
  constructor() {

   
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
    //let t_graft_segement_paths = this.graft_segment_paths(graft, path_all_points)

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

    let line = d3
      .line()
      .x(d => {
        return d.x;
      })
      .y(d => {
        return d.y;
      })
      //.curve(d3.curveCatmullRom.alpha(0.3));
      //.curve(d3_shape.curveBundle)
      //            .curve(d3.curveCardinal)
      //            .curve(d3.curveMonotoneY);
      .curve(d3.curveNatural);
    

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

    let path_all_points = [
      {
        x: p1.x,
        y: p1.y,
      },
      {
        x: point_at_05.x - 4,
        y: point_at_05.y - 2,
      },
      {
        x: point_at_10.x + 8,
        y: point_at_10.y - 4,
      },
      {
        x: point_at_20.x + 12,
        y: point_at_20.y - 2,
      },
      {
        x: point_at_30.x + 10,
        y: point_at_30.y - 3,
      },
      {
        x: point_at_40.x + 8,
        y: point_at_40.y - 2,
      },
      {
        x: point_at_50.x + 4,
        y: point_at_50.y - 2,
      },
      {
        x: point_at_60.x - 5,
        y: point_at_60.y - 2,
      },
      {
        x: point_at_70.x + 8,
        y: point_at_70.y - 2,
      },
      {
        x: point_at_75.x + 0,
        y: point_at_75.y - 2,
      },
      {
        x: point_at_80.x - 2,
        y: point_at_80.y - 2,
      },
      {
        x: point_at_90.x + 2,
        y: point_at_90.y - 2,
      },
      {
        x: point_at_95.x - 5,
        y: point_at_95.y - 2,
      },
      {
        x: p2.x,
        y: p2.y,
      },
    ];

    return path_all_points;
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
      .x(function(d) {
        return d.x;
      })
      .y(function(d) {
        return d.y;
      })
      // .curve(d3.curveCatmullRom.alpha(0.3));
      //.curve(d3.curveBundle)
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
    this.insert_graft_xy(graft, 'mid_graft_x', 'mid_graft_y', mid_points);
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
  } //function graft_segment_paths

  insert_graft_xy(graft, position_x, position_y, points) {
    let draw_template = get_draw_grafts_template();

    for (let i = 0; i < draw_template.length; i++) {
      let draw_template_i = draw_template[i];
      if (draw_template_i['cath_graft_prox_site'] == graft) {
        draw_template_i[position_x] = points[0]['x'];
        draw_template_i[position_y] = points[0]['y'];
      } //if
    } //for
  } //insert_graft_xy

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

