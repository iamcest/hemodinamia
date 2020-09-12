import {Gradients} from './gradients';

export class Segment_property {
  constructor(d3) {
    this.d3 = d3;
    this.gradients = new Gradients();
  }

  title(element) {
    let a_title = element
      .append('title')
      //.attr("class", "tooltip");
      .style('font', 'sans-serif')
      .style('font-size', '0.85em')
      .style('text-align', 'center')
      .style('cursor', 'default')
      .style('background-color', 'cyan');

    return a_title;
  }

  color_gradient(element) {
    let frame_element = this.d3.selectAll('#frame_element');
    this.gradients.linear(element, 'frame_gradient', '#636363', '#bdbdbd');

      let symbol_gradient = this.gradients.radial(
      element,
      'symbol_gradient',
      'cyan',
      'blue',
    );
    let lesion_gradient = this.gradients.radial(
      element,
      'lesion_gradient',
      '#7fcdbb',
      '#2c7fb8',
    );

    let arterial_gradient = this.gradients.linear(
      element,
      'arterial_gradient',
      '#d94701',
      'white',
    );
      /*
       ['#f1eef6','#bdc9e1','#74a9cf','#2b8cbe','#045a8d']
          * */
    let vessel_gradient = this.gradients.radial(
      element,
      'vessel_gradient',
      '#f1eef6',
      '#bdc9e1',
      '#74a9cf',
      '#2b8cbe',
      '#045a8d',
    );
    let variant_gradient_1 = this.gradients.radial(
      element,
      'variant_gradient_1',
      '#f1eef6',
      '#bdc9e1',
      '#74a9cf',
      '#2b8cbe',
      '#045a8d',
    );
    let collateral_gradient = this.gradients.linear(
      element,
      'collateral_gradient',
      '#a6bddb',
      '#1c9099',
    );
      //['#efedf5','#bcbddc','#756bb1']

      let node_gradient = this.gradients.radial(
      element,
      'node_gradient',
      '#efedf5',
      '#bcbddc',
    );
      let node_gradient_2 = this.gradients.blue_gradient(element,
          "node_gradient_2");
      //#e5f5f9 #99d8c9 #2ca25f

      let variant_gradient = this.gradients.radial(element,
          "variant_gradient",
          "#e41a1c",
          "#377eb8",
          "#4daf4a",
          "#984ea3",
          "#ff7f00");
        // ["#e41a1c","#377eb8","#4daf4a","#984ea3","#ff7f00"],

    let thrombus_gradient = this.gradients.linear(
      element,
      'thrombus_gradient',
      'red',
      '#ffff99',
    );
  } //color

} //class Segment_property
