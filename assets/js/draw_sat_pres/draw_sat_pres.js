//import p5 from 'p5';
import p5 from "p5/lib/p5.min"

var TEMPLATE=[{"name":"aortic_pres_sys", "measurement":"pressure","short_logo":"Sys ","logo":"Aortic Pressure Systolic","value":"", "pos_x":282, "pos_y":260},
{"name":"aortic_pres_dias", "measurement":"pressure","short_logo":"P.Diast ","logo":"Ao BP Diastolic","value":"", "pos_x":287, "pos_y":280},
{"name":"aortic_pres_mean", "measurement":"pressure","short_logo":"Mean ","logo":"Ao BP Mean","value":"", "pos_x":292, "pos_y":300},
{"name":"sao2_ao_root", "measurement":"saturation","short_logo":"sao2:","logo":"Ao Saturation","value":"", "pos_x":303, "pos_y":320},
{"name":"lv_pres_sys", "measurement":"pressure","short_logo":"Sys ","logo":"Left Ventricular Pressure Systolic","value":"", "pos_x":610, "pos_y":565},
{"name":"lv_pres_diastolic", "measurement":"pressure","short_logo":"Diast ","logo":"Left Ventricular Pressure Diastolic","value":"", "pos_x":610, "pos_y":585},
{"name":"lv_pres_mean", "measurement":"pressure","short_logo":"Mean ","logo":"Left Ventricular Pressure Mean","value":"", "pos_x":610, "pos_y":605},
{"name":"sao2_lv", "measurement":"saturation","short_logo":"Sat: ","logo":"Left Ventricular Saturation","value":"", "pos_x":610, "pos_y":625},
{"name":"pcw_pres_mean", "measurement":"pressure","short_logo":"Mean PCW  ","logo":"Mean PCW Pressure","value":"", "pos_x":690, "pos_y":320},
{"name":"sao2_pcw", "measurement":"saturation","short_logo":"PCW Sat  ","logo":"PCW Saturation","value":"", "pos_x":699, "pos_y":340},
{"name":"pa_pres_sys", "measurement":"pressure","short_logo":"Sys  ","logo":"Pulmonary Pressure Systolic","value":"", "pos_x":400, "pos_y":340},
{"name":"pa_pres_dia", "measurement":"pressure","short_logo":"Diast  ","logo":"Pulmonary Pressure Diastolic","value":"", "pos_x":398, "pos_y":360},
{"name":"pa_pres_mean", "measurement":"pressure","short_logo":"Mean  ","logo":"Pulmonary Pressure Mean","value":"", "pos_x":398, "pos_y":380},
{"name":"sao2_pa", "measurement":"saturation","short_logo":"Sat ","logo":"Pulmonary Sat in Main Trunk","value":"", "pos_x":393, "pos_y":400},
{"name":"rv_pres_sys", "measurement":"pressure","short_logo":"Sys ","logo":"RV Pressure Systolic","value":"", "pos_x":480, "pos_y":650},
{"name":"rv_pres_dias", "measurement":"pressure","short_logo":"Diast ","logo":"RV Pressure Diastolic","value":"", "pos_x":480, "pos_y":670},
{"name":"rv_pres_mean", "measurement":"pressure","short_logo":"Mean ","logo":"RV Pressure Mean","value":"", "pos_x":480, "pos_y":690},
{"name":"sao2_rv", "measurement":"saturation","short_logo":"Sat  ","logo":" RV Saturation","value":"", "pos_x":480, "pos_y":710},
{"name":"ra_pres_mean", "measurement":"pressure","short_logo":"P Mean ","logo":"RA Pressure Mean","value":"", "pos_x":290, "pos_y":505},
{"name":"sao2_ra_high", "measurement":"saturation","short_logo":"sao2:","logo":" RA Saturation High","value":"", "pos_x":175, "pos_y":480},
{"name":"sao2_ra_mid", "measurement":"saturation","short_logo":"sao2:","logo":" RA Saturation Mid","value":"", "pos_x":160, "pos_y":545},
{"name":"sao2_ra_low", "measurement":"saturation","short_logo":"sao2:","logo":" RA Saturation Low","value":"", "pos_x":170, "pos_y":630},
{"name":"sao2_rv_apex", "measurement":"saturation","short_logo":"sao2:","logo":" RV Saturation apex","value":"", "pos_x":550, "pos_y":715},
{"name":"sao2_rv_mid", "measurement":"saturation","short_logo":"sao2:","logo":" RV Saturation Mid","value":"", "pos_x":440, "pos_y":600},
{"name":"sao2_rv_outflow", "measurement":"saturation","short_logo":"sao2:","logo":" RV Saturation Outflow","value":"", "pos_x":400, "pos_y":575},
{"name":"sao2_svc_high", "measurement":"saturation","short_logo":"sao2:","logo":" SVC Saturation High","value":"", "pos_x":170, "pos_y":170},
{"name":"sao2_svc_low", "measurement":"saturation","short_logo":"sao2:","logo":" SVC Saturation Low","value":"", "pos_x":170, "pos_y":370},
{"name":"sao2_ivc", "measurement":"saturation","short_logo":"sao2:","logo":" SVC Saturation High","value":"", "pos_x":175, "pos_y":710},
{"name":"sao2_hepatic_veins", "measurement":"saturation","short_logo":"sao2 Hepatic Veins:","logo":" SVC Saturation Low","value":"", "pos_x":275, "pos_y":775},
{"name":"sat_pres_hb", "measurement":"info","short_logo":"Hb: ","logo":" Hb Value","value":"", "pos_x":570, "pos_y":50},
{"name":"syst_ejection_period", "measurement":"info","short_logo":"Sys Eject Period: ","logo":" Ejection Sys Period","value":"", "pos_x":570, "pos_y":70},
{"name":"ventr_dias_filling_period", "measurement":"info","short_logo":"Diast Filling Period: ","logo":" Ejection Sys Period","value":"", "pos_x":570, "pos_y":90},
{"name":"sat_pres_oxygen_consumption", "measurement":"info","short_logo":"VO2: ","logo":" O2","value":"", "pos_x":570, "pos_y":110},
{"name":"uni_qp_qs", "measurement":"info","short_logo":"Qp/Qs ","logo":" Qp Qs: ","value":"", "pos_x":570, "pos_y":130},
{"name":"sao2_ao_distal", "measurement":"saturation","short_logo":"sao2:","logo":" Sat ","value":"", "pos_x":491, "pos_y":817},
{"name":"hepatic_veins_pres", "measurement":"saturation","short_logo":"Hepatic Veins Pres:","logo":" Hepatic V Pres","value":"", "pos_x":275, "pos_y":795},


]



//import 'p5/lib/p5';
/*
class P5_start {
  init() {
   let start;
   return start = new p5(function(p){
     const draw = new Draw();
     const utility = new Utility();
     let img = null;


     p.setup =  function() {
        //canvas = p.createCanvas(p.windowWidth, p.windowHeight)
        const canvas = p.createCanvas(900, 900);
        canvas.parent('draw_pressures_div');
        canvas.id('canvas_draw_pressures_div');
        canvas.style("max-width", "100%");
        img = utility.load_image(p);
        return p.frameRate(30);
      };


     p.draw = function() {
      //draw.shape_gl(p)
      p.clear();
      return draw.shape(p, img);
    };

     return p.windowResized = () =>
       //p.resizeCanvas(p.windowWidth, p.windowHeight)
       p.resizeCanvas(900, 900)
     ;
   });
 }
}
 
///////////////////
class Utility {
  load_image(p) {
        const url = 'http://localhost:4000/images/cath_heart.jpg';
        const img = p.loadImage(url);
        //p.image(img, 0, p.height/2, img.width/2, img.height/2);
        return img;
      }
}

class Grid {
  show(p) {
    p.push();
    p.stroke(0);
    p.strokeWeight(0.5);
    p.line(0, 200,  p.width, 200);
    for (let i = 0, end = p.width; i <= end; i += 10) {
      p.line(0, i, p.width, i);
    }
    return p.pop();
  }
}
class Finding {
  over_element(p, t) {
      const value_width = p.textWidth(t.value);
      const logo_width = p.textWidth(t.short_logo);
      const text_width =  value_width +  logo_width + 30;


      if ((p.mouseX >= t.pos_x) && (p.mouseX <= (t.pos_x + text_width)) && (p.mouseY >= t.pos_y) && (p.mouseY <= (t.pos_y+20))) {
         p.fill(252,141,89);
         p.textSize(14);
         p.textStyle(p.BOLD);

         p.push();
         p.fill(255,255,191);
         //p.stroke(255,127,0)
         //p.strokeWeight(1)
         p.rectMode(p.CORNER);
         p.rect(t.pos_x-2, t.pos_y-2, text_width, 18 );
         return p.pop();

      } else {
         p.fill(0);
         return p.textSize(12);
     }
  }

  pressure(p, t) {
      p.push();
      p.noStroke();
      p.textAlign(p.LEFT, p.TOP);
      const change = this.over_element(p,t);
      const text_value = p.text(t.short_logo + "" +t.value, t.pos_x, t.pos_y);
      return p.pop();
  }


  info(p, t) {

      p.push();
      p.noStroke();
      p.textAlign(p.LEFT, p.TOP);
      const change = this.over_element(p,t);
      const text_value = p.text(t.short_logo + "" +t.value, t.pos_x, t.pos_y);
      return p.pop();
  }





  saturation(p, t) {
      p.push();
      p.noStroke();
      p.textAlign(p.LEFT, p.TOP);
      const change = this.over_element(p,t);
      const text_value = p.text(t.short_logo + " " +t.value + "", t.pos_x, t.pos_y);
      return p.pop();
  }
}

      //p.push()
      //p.noFill()
      //text_width = p.textWidth(t.value)
      //p.pop()

//////////////////
//
// 

var Draw = (function() {
    let grid = undefined;
    let finding = undefined;
    Draw = class Draw {
      static initClass() {
          grid = new Grid();

          finding = new Finding();
      }

      shape_gl(p) {
            const mouse = [p.mouseX, p.mouseY];
            const last_mouse = [p.pmouseX, p.pmouseY];
            p.translate(-250 * 2.5, 0, 0);
            p.normalMaterial();
            p.push();
            p.rotateZ(p.frameCount * 0.01);
            p.rotateX(p.frameCount * 0.01);
            p.rotateY(p.frameCount * 0.01);
            p.plane(180);
            p.pop();
            p.translate(250, 0, 0);
            p.push();
            p.rotateZ(p.frameCount * 0.01);
            p.rotateX(p.frameCount * 0.01);
            p.rotateY(p.frameCount * 0.01);
            p.box(80, 80, 80);
            return p.pop();
        }

      shape(p, img) {
          p.background(0);
          p.imageMode(p.CENTER);
          p.image(img, p.width/2, p.height/2, img.width*2.2, img.height*2.2);
          p.fill(0, 180, 180);
          p.stroke(0,0,255);
          p.fill(102, 153, 0);//green
          p.strokeWeight(5);
          p.push();
          for (let t of Array.from(template)) {
             if (t.measurement ===  'pressure') {
                 finding.pressure(p, t);
             } else if (t.measurement ===  'saturation') {
                 finding.saturation(p, t);
             } else if (t.measurement ===  'info') {
                 finding.info(p, t);
              }
          }

          return p.pop();
      }
  };
    Draw.initClass();
    return Draw;
})();

var Prepare_templates = (function() {
  let proccess_data = undefined;
  Prepare_templates = class Prepare_templates {
    static initClass() {

      proccess_data = function(db_data) {

        let p_p5;
        const arr_db_data = new Array();
        for (let k  in db_data['cath_pressures_saturation']) {
          const v = db_data['cath_pressures_saturation'][k];
          for (let t of Array.from(template)) {
            if (k === t.name) {
              t.value = v;
            }
          }
        }

        const setup = new P5_start();
        return p_p5 = setup.init();
      };
    }
    constructor(procedures_id, pressures_id) {
      this.procedures_id = procedures_id;
      this.pressures_id = pressures_id;
    }

    init() {
      return this.get_stored_data();
    }


    get_stored_data() {
        return $.ajax({
            type:"GET",
            url:`/cath_procedures/${this.procedures_id}/cath_pressures_saturations/${this.pressures_id}`,
            //url:'/cath_procedures/' +@cath_procedure_id + '/cor_angio_infos/'+ @info_id,
            dataType: 'json',
            success( db_data) {
               return proccess_data( db_data);
             }
            });
      }
  };
  Prepare_templates.initClass();
  return Prepare_templates;
})();

//this.remove_pressures = () => jQuery("#canvas_draw_pressures_div").remove();


this.draw_pressures = function(procedures_id, pressures_id) {
    //this.remove_pressures();

    const prepare = new Prepare_templates(procedures_id, pressures_id);
    return prepare.init();
  };
 
*/

class Grid {
  show(p) {
    p.push();
    p.stroke(0);
    p.strokeWeight(0.5);
    p.line(0, 200,  p.width, 200);
    for (let i = 0, end = p.width; i <= end; i += 10) {
      p.line(0, i, p.width, i);
    }
    return p.pop();
  }
}

///////////////////////
class Finding{
 over_element(p, t) {
        const value_width = p.textWidth(t.value);
        const logo_width = p.textWidth(t.short_logo);
        const text_width =  value_width +  logo_width + 30;


        if ((p.mouseX >= t.pos_x) && (p.mouseX <= (t.pos_x + text_width)) && (p.mouseY >= t.pos_y) && (p.mouseY <= (t.pos_y+20))) {
          // p.fill(90,180,172);//green
             p.fill(175,141,195);
           p.textSize(16);
           p.textStyle(p.BOLD);

           p.push();

           //p.fill(245,245,245);//near white
             p.fill(247,247,247);
           p.rectMode(p.CORNER);
           p.rect(t.pos_x-2, t.pos_y-2, text_width, 18 );
           return p.pop();

        } else {
           p.fill(0);
           return p.textSize(12);
         }
      };
 ////////////////
pressure(p, t) {
            p.push();
            p.noStroke();
            p.textAlign(p.LEFT, p.TOP);
            const change = this.over_element(p,t);
            const text_value = p.text(t.short_logo + "" +t.value, t.pos_x, t.pos_y);
            return p.pop();
      };

  ///////////
  info(p, t) {

            p.push();
            p.noStroke();
            p.textAlign(p.LEFT, p.TOP);
            const change = this.over_element(p,t);
            const text_value = p.text(t.short_logo + "" +t.value, t.pos_x, t.pos_y);
            return p.pop();
      };
  ///////
    saturation(p, t) {
        p.push();
        p.noStroke();
        p.textAlign(p.LEFT, p.TOP);
        const change = this.over_element(p,t);
        const text_value = p.text(t.short_logo + " " +t.value + "", t.pos_x, t.pos_y);
        return p.pop();
      };
};//class FINDING

////////////////////////
class Draw{
constructor(){
//let grid = undefined;

}
shape(p, img) {
           let finding = new Finding()
    //p.background(0);
     p.background("#eee")
          p.imageMode(p.CENTER);
          p.image(img, p.width/2, p.height/2, img.width*2.2, img.height*2.2);
          p.fill(0, 180, 180);
          p.stroke(0,0,255);
    p.fill(102, 153, 0);//green
          p.strokeWeight(5);
          /*
          Show mouse position
          */
          p.push()
          p.fill(0)
          p.noStroke()
          p.textSize(13)
          p.textAlign(p.LEFT, p.TOP)
          p.text(p.ceil(p.mouseX) + ", " + p.ceil(p.mouseY), p.mouseX+10, p.mouseY+10);
          //p.text(p.ceil(p.mouseX+10) + ", " + p.ceil(p.mouseY+10), p.mouseX+10, p.mouseY+10);
          p.pop()
  p.push()
  p.textSize(20)
 p.textStyle(p.BOLD);

  for (let t of Array.from(TEMPLATE)) {
     if (t.measurement ===  'pressure') {
         finding.pressure(p, t);
     } else if (t.measurement ===  'saturation') {
         finding.saturation(p, t);
     } else if (t.measurement ===  'info') {
         finding.info(p, t);
    }
}
     p.pop()



};
}
///////////////
class Utility {
  load_image(p) {
     const url = 'http://localhost:4000/images/cath_heart.jpg';
     
      const img = p.loadImage(url);
      //console.log(img)
        //p.image(img, 0, p.height/2, img.width/2, img.height/2);
        return img;
      }
}

class P5_start {
  init() {
   let start;
   return start = new p5(function(p){
     const draw = new Draw();
     const utility = new Utility();
     let img = null;


     p.setup =  function() {
        const canvas = p.createCanvas(900, 900);
        canvas.parent('draw_pressures_div');
        canvas.id('canvas_draw_pressures_div');
        //canvas.style("max-width", "100%");//gives error
        img = utility.load_image(p);
        return p.frameRate(30);
      };


     p.draw = function() {
      p.clear();
      return draw.shape(p, img);
    };

     return p.windowResized = () =>
       p.resizeCanvas(900, 900)
     ;
   });
 }
}
////////////////// 
class Prepare_data{
constructor(){
// ready_data = [];
 this.build_data();

};

build_data(){
    let db_data = SAT_PRES_DATA;
  // console.log("-------------------")
 //  console.log(JSON.stringify(db_data))
 for (let k  in db_data['sat_pressure']) {
   const v = db_data['sat_pressure'][k];
    for (let t of Array.from(TEMPLATE)) {
      if (k === t.name) {
        t.value = v;
     }
   }
  }

 //console.log("TEMPLATE: " + JSON.stringify(TEMPLATE))
};//build_data

};//class
//////////////////////
export class SetupP5{
 constructor(){
    this.make_button()

   };

  make_button(){
    var button = document.createElement("button");
    button.innerHTML = "Show Sat Pressures Diagram";
    button.classList.add("large");
    button.classList.add("expanded");
    button.classList.add("button");
    button.classList.add("is-primary");
    var draw_div = document.querySelector('#draw_pressures_button_div');
    if (draw_div !== null) {
    draw_div.appendChild(button);
        button.addEventListener ("click", function() {
          $("#canvas_draw_pressures_div").remove()
            //console.log("-------------")
       let prepare = new Prepare_data();

       let  start = new P5_start();
            start.init()


     });
    }; //if
  };
};

const draw_sats_init = () => {
    const main = new SetupP5();
};

//init();
draw_sats_init();

