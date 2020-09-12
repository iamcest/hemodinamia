# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#mouse = [p.mouseX,p.mouseY]
#lastMouse = [p.pmouseX,p.pmouseY]
template = [{"name":"aortic_pressure_systolic", "measurement":"pressure","short_logo":"Sys ","logo":"Aortic Pressure Systolic","value":"", "pos_x":282, "pos_y":260},
{"name":"aortic_pressure_diastolic", "measurement":"pressure","short_logo":"Diast ","logo":"Ao BP Diastolic","value":"", "pos_x":287, "pos_y":280},
{"name":"aortic_pressure_mean", "measurement":"pressure","short_logo":"Mean ","logo":"Ao BP Mean","value":"", "pos_x":292, "pos_y":300},
{"name":"aortic_sat", "measurement":"saturation","short_logo":"Sat: ","logo":"Ao Saturation","value":"", "pos_x":303, "pos_y":320},
{"name":"lv_pressure_systolic", "measurement":"pressure","short_logo":"Sys ","logo":"Left Ventricular Pressure Systolic","value":"", "pos_x":610, "pos_y":565},
{"name":"lv_pressure_diastolic", "measurement":"pressure","short_logo":"Diast ","logo":"Left Ventricular Pressure Diastolic","value":"", "pos_x":610, "pos_y":585},
{"name":"lv_pressure_mean", "measurement":"pressure","short_logo":"Mean ","logo":"Left Ventricular Pressure Mean","value":"", "pos_x":610, "pos_y":605},
{"name":"lv_sat", "measurement":"saturation","short_logo":"Sat: ","logo":"Left Ventricular Saturation","value":"", "pos_x":610, "pos_y":625},
{"name":"pcw_pressure_mean", "measurement":"pressure","short_logo":"Mean PCW  ","logo":"Mean PCW Pressure","value":"", "pos_x":690, "pos_y":320},
{"name":"pcw_sat", "measurement":"saturation","short_logo":"PCW Sat  ","logo":"PCW Saturation","value":"", "pos_x":699, "pos_y":340},
{"name":"pulmonary_pressure_systolic", "measurement":"pressure","short_logo":"Sys  ","logo":"Pulmonary Pressure Systolic","value":"", "pos_x":400, "pos_y":340},
{"name":"pulmonary_pressure_diastolic", "measurement":"pressure","short_logo":"Diast  ","logo":"Pulmonary Pressure Diastolic","value":"", "pos_x":398, "pos_y":360},
{"name":"pulmonary_pressure_mean", "measurement":"pressure","short_logo":"Mean  ","logo":"Pulmonary Pressure Mean","value":"", "pos_x":398, "pos_y":380},
{"name":"pulmonary_sat_main", "measurement":"saturation","short_logo":"Sat ","logo":"Pulmonary Sat in Main Trunk","value":"", "pos_x":393, "pos_y":400}
{"name":"rv_pressure_systolic", "measurement":"pressure","short_logo":"Sys ","logo":"RV Pressure Systolic","value":"", "pos_x":480, "pos_y":650},
{"name":"rv_pressure_diastolic", "measurement":"pressure","short_logo":"Diast ","logo":"RV Pressure Diastolic","value":"", "pos_x":480, "pos_y":670},
{"name":"rv_pressure_mean", "measurement":"pressure","short_logo":"Mean ","logo":"RV Pressure Mean","value":"", "pos_x":480, "pos_y":690},
{"name":"rv_sat", "measurement":"saturation","short_logo":"Sat  ","logo":" RV Saturation","value":"", "pos_x":480, "pos_y":710},
{"name":"ra_pressure_mean", "measurement":"pressure","short_logo":"P Mean ","logo":"RA Pressure Mean","value":"", "pos_x":290, "pos_y":505},
{"name":"ra_sat_high", "measurement":"saturation","short_logo":"Sat High  ","logo":" RA Saturation High","value":"", "pos_x":175, "pos_y":480},
{"name":"ra_sat_mid", "measurement":"saturation","short_logo":"Sat Mid  ","logo":" RA Saturation Mid","value":"", "pos_x":160, "pos_y":545},
{"name":"ra_sat_low", "measurement":"saturation","short_logo":"Sat Low  ","logo":" RA Saturation Low","value":"", "pos_x":170, "pos_y":630},
{"name":"rv_sat_apex", "measurement":"saturation","short_logo":"Apex ","logo":" RV Saturation apex","value":"", "pos_x":550, "pos_y":715},
{"name":"rv_sat_mid", "measurement":"saturation","short_logo":"Mid ","logo":" RV Saturation Mid","value":"", "pos_x":440, "pos_y":600},
{"name":"rv_sat_outflow", "measurement":"saturation","short_logo":"Outflow ","logo":" RV Saturation Outflow","value":"", "pos_x":400, "pos_y":575},
{"name":"svc_sat_high", "measurement":"saturation","short_logo":" ","logo":" SVC Saturation High","value":"", "pos_x":170, "pos_y":170},
{"name":"svc_sat_low", "measurement":"saturation","short_logo":" ","logo":" SVC Saturation Low","value":"", "pos_x":170, "pos_y":370},
{"name":"ivc_sat_high", "measurement":"saturation","short_logo":"","logo":" SVC Saturation High","value":"", "pos_x":175, "pos_y":710},
{"name":"ivc_sat_low", "measurement":"saturation","short_logo":"","logo":" SVC Saturation Low","value":"", "pos_x":175, "pos_y":775},
{"name":"hb_value", "measurement":"info","short_logo":"Hb: ","logo":" Hb Value","value":"", "pos_x":570, "pos_y":50},
{"name":"syst_ejection_period", "measurement":"info","short_logo":"Sys Eject Period: ","logo":" Ejection Sys Period","value":"", "pos_x":570, "pos_y":70},
{"name":"diast_filling_period", "measurement":"info","short_logo":"Diast Filling Period: ","logo":" Ejection Sys Period","value":"", "pos_x":570, "pos_y":90},

{"name":"oxygen_consumption", "measurement":"info","short_logo":"O2 Cons: ","logo":" O2","value":"", "pos_x":570, "pos_y":110},
{"name":"qp_qs", "measurement":"info","short_logo":"Qp/Qs ","logo":" Qp Qs: ","value":"", "pos_x":570, "pos_y":130}
]











class P5_start
  init: () ->
   start = new p5 (p)-> 
     draw = new Draw()
     utility = new Utility()
     img = null


     p.setup =  ->
        #canvas = p.createCanvas(p.windowWidth, p.windowHeight)
        canvas = p.createCanvas(900, 900)
        canvas.parent('draw_pressures_div')
        canvas.id('canvas_draw_pressures_div')
        canvas.style("max-width", "100%")
        img = utility.load_image(p)
        p.frameRate(30)


     p.draw = ->
      #draw.shape_gl(p)
      p.clear()
      draw.shape(p, img)
    
     p.windowResized = ->
       #p.resizeCanvas(p.windowWidth, p.windowHeight)
       p.resizeCanvas(900, 900)


class Utility
  load_image: (p) ->
        url = 'http://localhost:4000/images/cath_heart.jpg';
        img = p.loadImage(url)
        #p.image(img, 0, p.height/2, img.width/2, img.height/2);
        return img

class Grid 
  show: (p) ->
    p.push()
    p.stroke(0)
    p.strokeWeight(0.5)
    p.line(0, 200,  p.width, 200)
    for i in [0..p.width] by 10
      p.line(0, i, p.width, i)
    p.pop()

    
    

class Finding
  over_element: (p, t) ->
      value_width = p.textWidth(t.value)
      logo_width = p.textWidth(t.short_logo)
      text_width =  value_width +  logo_width + 30


      if (p.mouseX >= t.pos_x && p.mouseX <= t.pos_x + text_width && p.mouseY >= t.pos_y && p.mouseY <= t.pos_y+20) 
         p.fill(252,141,89)
         p.textSize(14)
         p.textStyle(p.BOLD)

         p.push()
         p.fill(255,255,191)
         #p.stroke(255,127,0)
         #p.strokeWeight(1)
         p.rectMode(p.CORNER)
         p.rect(t.pos_x-2, t.pos_y-2, text_width, 18 )
         p.pop()
      
      else
         p.fill(0)
         p.textSize(12)
    
  pressure: (p, t) ->
      p.push()
      p.noStroke()
      p.textAlign(p.LEFT, p.TOP)
      change = @over_element(p,t)
      text_value = p.text(t.short_logo + "" +t.value, t.pos_x, t.pos_y)
      p.pop()

  
  info: (p, t) ->
      
      p.push()
      p.noStroke()
      p.textAlign(p.LEFT, p.TOP)
      change = @over_element(p,t)
      text_value = p.text(t.short_logo + "" +t.value, t.pos_x, t.pos_y)
      p.pop()

  



  saturation: (p, t) ->
      p.push()
      p.noStroke()
      p.textAlign(p.LEFT, p.TOP)
      change = @over_element(p,t)
      text_value = p.text(t.short_logo + " " +t.value + "", t.pos_x, t.pos_y)
      p.pop()

      #p.push()
      #p.noFill()
      #text_width = p.textWidth(t.value)
      #p.pop()


class Draw
  grid = new Grid()
  
  finding = new Finding()

  shape_gl: (p) ->
        mouse = [p.mouseX, p.mouseY]
        last_mouse = [p.pmouseX, p.pmouseY]
        p.translate(-250 * 2.5, 0, 0);
        p.normalMaterial()
        p.push();
        p.rotateZ(p.frameCount * 0.01);
        p.rotateX(p.frameCount * 0.01);
        p.rotateY(p.frameCount * 0.01);
        p.plane(180);
        p.pop()
        p.translate(250, 0, 0);
        p.push()
        p.rotateZ(p.frameCount * 0.01);
        p.rotateX(p.frameCount * 0.01);
        p.rotateY(p.frameCount * 0.01);
        p.box(80, 80, 80);
        p.pop();

  shape: (p, img) ->
      p.background(0)
      p.imageMode(p.CENTER)
      p.image(img, p.width/2, p.height/2, img.width*2.2, img.height*2.2)
      p.fill(0, 180, 180)
      p.stroke(0,0,255)
      p.fill(102, 153, 0)#green
      p.strokeWeight(5)
      ### 
      p.push()
      p.fill(0)
      p.noStroke()
      p.textSize(18)
      p.textAlign(p.LEFT, p.TOP)
      p.text(p.ceil(p.mouseX) + ", " + p.ceil(p.mouseY), p.mouseX, p.mouseY);
      p.pop()
      ###
      p.push()
      for t in template
         if t.measurement is  'pressure'
             finding.pressure(p, t) 
         else if t.measurement is  'saturation'
             finding.saturation(p, t) 
         else if t.measurement is  'info'
             finding.info(p, t) 

      p.pop()





class Prepare_templates
  constructor: (procedures_id, pressures_id) ->
    @procedures_id = procedures_id  
    @pressures_id = pressures_id

  init:  ->
    @get_stored_data()


  get_stored_data: () ->
      $.ajax({
          type:"GET",
          url:'/cath_procedures/' + @procedures_id + '/cath_pressures_saturations/' +@pressures_id,
          #url:'/cath_procedures/' +@cath_procedure_id + '/cor_angio_infos/'+ @info_id,
          dataType: 'json',
          success: ( db_data) ->
             proccess_data( db_data)
          })

  proccess_data = (db_data) ->
    
    arr_db_data = new Array()
    for k,v  of db_data['cath_pressures_saturation']
      for t in template
        if k is t.name
          t.value = v
        
    setup = new P5_start()
    p_p5 = setup.init()


this.remove_pressures = () ->
  jQuery("#canvas_draw_pressures_div").remove()


this.draw_pressures = (procedures_id, pressures_id) ->
    @remove_pressurs()
    
    prepare = new Prepare_templates(procedures_id, pressures_id)
    prepare.init()
  
