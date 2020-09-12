# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/





natives_template =[ {"segment_no": "rca_ostium","path": "m297.69 538.09-14.682 5.3918-7.612 4.6744", "size":"4.0","name":"RCA Ostium","vessel":"RCA"}, {"segment_no": "rca_distal", "path": "m218.99 698.03-1.5121 41.651 8.7891 27.091 11.156 21.371 19.015 7.2398c6.5039 5.0053 26.442 4.32 35.069 4.5724 18.356 0.53704 26.225-4.8624 30.761-13.731 9.5738-16.453 24.648 19.954 34.221-47.86 0.76358-4.4425 5.6127-1.9023 8.899-0.0253","size":"2.4" ,"name":"RCA Distal","vessel":"RCA"}, {"segment_no": "rca_v_branch","path": "m248.46 593.9-18.76-8.0589-15.152 2.4323-22.181 10.294-7.2098 18.393c-3.5852 17.053-28.89 26.097-24.915 41.15 3.4524 4.0437 4.6819 18.719 4.6819 18.719l-0.43432 14.19 17.386 36.846", "size":"1.8","name":"RCA Ventricular Branch","vessel":"RCA"},  {"segment_no":"rca_conus", "path":"m280.66 545.08 7.0099-14.912c2.6858-8.1897-7.5235-13.609-13.535-13.792-4.0474-0.12329-3.5544 6.7326-16.304 6.5996l-7.9347 6.368-4.1234 14.73", "size":"1.6","name":"RCA Conus","vessel":"RCA"}, {"segment_no":"rca_pla", "path":"m365.05 738.05 34.083 21.072 31.811 15.051 9.7958 4.0411", "size":"1.6","name":"RCA Posterior Lateral","vessel":"RCA"}, {"segment_no":"lm_ostium", "path":"m368.3 504.55 14.088 0.38992 7.6048 2",  "size":"4.5","name":"Left Main Ostium","vessel":"LM"}, {"segment_no":"lm_body", "path":"m390.53 507.32 12.868 4.1071 9.878 5.1786",  "size":"4.6","name":"Left Main Body","vessel":"LM"}, {"segment_no":"lm_bifurcation", "path":"m413.08 516.84 6.483 6.214 4.25 7.3341",  "size":"4.3","name":"Left Main Bifurcation","vessel":"LM"}, {"segment_no":"lad_ostium", "path":"m424.8 530.9-10.375 16.036",  "size":"3.7","name":"LAD Ostium","vessel":"LAD"}, {"segment_no":"lad_prox", "path":"m414.97 546.39-11.059 11.132-9.4579 15.994-11.344 26.197",  "size":"3.6","name":"LAD Proximal","vessel":"LAD"}, {"segment_no":"lad_mid", "path":"m383.54 599.02-5.561 8.3156-14.229 21.303-12.322 32.324-12.696 27.768",  "size":"2.4" ,"name":"LAD Mid","vessel":"LAD"}, {"segment_no":"lad_distal", "path":"m339.9 686.53-13.269 24.558c-5.184 10.55-13.254 19.947-18.438 38.659-2.0635 3.226-0.002 13.122-6.8409 30.906l-3.0557 15.723-2.2462 25.374-0.90583 27.217 2.6071 27.334 7.3537 11.581 12.653 8.6464 6.8198 2.692 13.252-4.4777 6.939-6.2686 4.1714-8.2767","size":"2.1","name":"LAD Distal","vessel":"LAD"}, {"segment_no":"lad_d1", "path":"m385.91 592.69 16.601 13.11 6.6605 11.11c2.7378 23.721 7.2257 16.037 9.9635 25.18l4.627 22.545-2.2879 16.424c4.7204 13.63 14.88 13.662 14.161 40.889", "size":"1.4","name":"LAD 1st Diagonal","vessel":"LAD"}, {"segment_no":"lad_d1_branch", "path":"m403.91 608.65c2.8924 2.1384 10.391 7.3437 10.391 7.3437s1.8981 1.4362 9.2262 11.512l4.8992 16.125 3.2319 20.453c3.4214 10.63-5.0001 22.951 10.264 31.889", "size":"1.1","name":"LAD 1st Diagonal Branch","vessel":"LAD"}, {"segment_no":"lcx_ostium", "path":"m424.03 530.96 8.3896 2.1678 10.787 6.5034", "size":"3.4","name":"LCX Ostium","vessel":"LCX"}, {"segment_no":"lcx_prox", "path":"m442.04 538.47c12.387 5.3914 21.909 5.0527 37.161 16.174l13.441 1.5", "size":"3.2","name":"LCX Proximal","vessel":"LCX"}, {"segment_no":"lcx_mid", "path":"m490.69 554.9 22.697 10.451 19.454 25.083 7.2954 20.902 4.8636 24.386","size":"2.8","name":"LCX mid","vessel":"LCX"}, {"segment_no":"lcx_distal", "path":"m544.02 628.57 3.8867 36.219-3.239 25.618-3.0912 27.134", "size":"2.1","name":"LCX Distal","vessel":"LCX"}, {"segment_no":"lcx_pla", "path":"m541.54 716.38-1.2143 17.786c-2.8199 8.4003 0.0283 31.365-11.07 34.607-12.798 3.7384-14.528 2.2456-23.501 13.822l-68.286-4.9286",  "size":"2.1","name":"LCX Posterior Lateral ","vessel":"LCX"}, {"segment_no":"lcx_om2", "path":"m538.27 604.06-2.1594 25.901-8.975 21.436-14.694 19.354-6.357 11.228-23.601 25.872",  "size":"1.8","name":"LCX OM 2","vessel":"LCX"},   {"segment_no":"lcx_om3", "path":"m546.4 648.48-3.3408 10.305c-1.6442 7.5373-2.5278 19.575-13.432 27.112l-15.251 29.531-26.376 45.579", "size":"1.6","name":"LCX OM 3","vessel":"LCX"}, {"segment_no":"lcx_om3_branch","path":"m534.48 680.18-2.5213 30.555c-2.6596-0.49134-8.1683 15.503-16.161 24.344l-16.682 23.821", "size":"1.3","name":"LCX OM 3 Branch","vessel":"LCX"}, {"segment_no":"lcx_pl1", "path":"m503.7 783.54-9.6339 5.9987-9.0594 10.113c-2.6975 7.8426-14.658 3.4254-21.922 22.874l-3.9776 9.5591-14.891 22.595",  "size":"1.6","name":"LCX 1st Posterior Lateral","vessel":"LCX"},   {"segment_no":"lcx_pl2", "path":"m476.77 781-2.6582 9.4308-13.641 10.262c-4.6155 4.5405 0 0-13.686 19.518l-14.014 10.297-8.923 25.773",  "size":"1.6","name":"LCX 2nd Posterior Lateral","vessel":"LCX"}, {"segment_no":"lcx_om1_branch", "path":"m500.15 582.3 6.2997 9.3591c2.6083 5.004 0.71661 15.026 3.3249 16.359l-5.4848 23.599 0.65992 14.135-2.9798 15.017-5.8098 12.113-7.9899 20.307",  "size":"1.2","name":"LCX 1st OM Branch","vessel":"LCX"}, {"segment_no":"lcx_om2_branch", "path":"m531.91 638.52-2.8332 17.216-6.081 14.716-0.41463 8.7152c10.417 7.4302-21.015 13.651-28.194 34.718l-6.4266 11.001", "size":"1.1","name":"LCX 2nd OM Branch","vessel":"LCX"}, {"segment_no":"rca_pl1", "path":"m378.46 745.53v12.363l-7.5945 25.18-19.051 34.907-4.6889 13.044", "size":"1.4","name":"RCA 1st Posterior Lateral","vessel":"RCA"}, {"segment_no":"rca_pl2", "path":"m395.81 758.38-4.9421 9.3928-2.733 8.7086c-3.4341 3.788-7.6946 12.943-12.776 23.322l-6.2867 9.6414-4.4925 9.3715-14.421 18.631", "size":"1.4","name":"RCA 2nd Posterior Lateral","vessel":"RCA"},  {"segment_no":"lcx_pl3", "path":"m463.65 779.43-8.1835 14.512-7.157 8.8961-8.2329 9.939-11.438 9.0728-7.1633 8.3078-4.6694 7.1778-9.1492 11.323-2.3732 10.459", "percent_stenosis":"0", "stents_present":"0", "stents_path": "0", "size":"1.2","name":"LCX 3rd Posterior Lateral","vessel":"RCA"}, {"segment_no":"ramus", "path":"m423.66 531.32 12.187 14.544c-0.6809 8.1709 7.7518 12.11 1.4902 25.225l1.9112 8.163c-3.2644 11.627-5.6496 43.722 3.6291 60.691l1.2136 20.22c21.508 32.62 6.6807 24.363 10.021 36.544",  "size":"2.1","name":"Ramus","vessel":"Ramus"}, {"segment_no":"ramus_branch", "path":"m435.5 546.55c5.8843 8.0859 9.9221 14.9 18.395 24.769l1.5986 20.594-4.4672 23.549 3.1558 49.811", "percent_stenosis":"0", "stents_present":"0", "stents_path": "0", "size":"1.8","name":"Ramus Branch","vessel":"Ramus"}, {"segment_no":"lad_d2", "path":"m366.9 622.74c4.1001 2.8699 9.2373-0.48268 12.3 8.6098 11.238 5.9042 7.5379 17.784 11.307 26.676 2.0488 4.0808 16.22 32.63 14.393 27.964l5.5 19.286 14 25", "size":"1.2","name":"LAD 2nd Diagonal","vessel":"LAD"}, {"segment_no":"lad_d2_branch", "path":"m382.58 633.47 16.327 10.21 9.8892 15.589 5.8097 15.332 5.4071 24.672",  "size":"1.0","name":"LAD 2nd Diagonal Branch","vessel":"LAD"}, {"segment_no":"lad_d3", "path":"m345.68 672.88 4.8579 12.125 5.9069 4.3978 2.7352 7.2273c3.324 3.5759 1.417 17.086 22.857 27.429l23.958 17.8 11.685 14.128",  "size":"1.1","name":"LAD 3rd Diagonal","vessel":"LAD"}, {"segment_no":"lad_d3_branch", "path":"m356.16 688.94 14.188 4.2845 5.27 6.0109 8.2516 9.3256c9.7558 9.4149 3.6612 14.417 14.424 17.83l6.999 9.971",  "size":"0.9" ,"name":"LAD 3rd Diagonal Branch Ostium","vessel":"LAD"}, {"segment_no":"rca_acute_marginal", "path":"m219.4 698.31-16.552 8.2889-7.3759 7.236-4.5105 16.264-0.49941 11.305 7.7468 8.5696 2.4637 24.301c-2.0702 18.694 6.8028 17.452 13.237 22.386l21.49 21.649",  "size":"1.6","name":"RCA Acute Marginal","vessel":"RCA"}, {"segment_no":"rca_sa", "path":"m271.86 553.03 16.991 6.425 21.964-3.8124 19.931-16.959 5.7045-16.98", "size":"1.1","name":"RCA Sino Atrial","vessel":"RCA"}, {"segment_no":"rca_pl3", "path":"m409.97 764.3-5.8501 8.7229-6.7544 9.3628-8.3085 15.722-8.7669 11.223-13.971 22.511",  "size":"1.2","name":"RCA 3rd Posterior Lateral","vessel":"RCA"}, {"segment_no":"rca_mid", "path":"m244.4 597.31-5.5 5.5-12.5 16.5-6 11.5c-2.8333 10.667-7.1667 18.182-8 39.5l6.5 28", "size":"3.5","name":"RCA Mid","vessel":"RCA"}, {"segment_no":"lad_septal", "path":"m377.15 608.31-14.637 3.2181-9.1133 3.5319c-9.7313 3.896-11.699 11.746-20.675 24.211l-6.7296 3.9774-5.2774 17.082-6.4574 12.235-4.42 17.089-2.1903 21.655 1 31.5",  "size":"1.1","name":"LAD 1st Septal","vessel":"LAD"}, {"segment_no":"lad_septal_2", "path":"m379.7 605.69-18.632 3.2331-13.331 7.6291-15.404 13.968c-6.9276 6.3572-9.7268 13.936-11.944 19.057l-4.9059 8.3944c-0.56843 8.3114-9.5621 9.3078-6.868 27.21l-2.8627 14.747-2.0445 8.6184",  "size":"1.0","name":"LAD 2nd Septal","vessel":"LAD"}, {"segment_no":"lad_septal_3", "path":"m359.45 639.94-17.742 14.778-8.885 5.876-20.008 33.006-6.5912 35.009v14.778",  "size":"1.1"}, {"segment_no":"rca_prox", "path":"m275.9 547.81-10 9.5-6 12.5-11 24-5 3.5", "size":"4.0","name":"LAD 3rd Septal","vessel":"LAD"}, {"segment_no":"rca_septal", "path":"m344.85 820.71-2.3709-12.838c-12.73 4.7553 6.159-52.729-2.7614-42.094-29.024-25.44 3.6438-42.935-3.2843-50.403", "size":"1.1","name":"RCA Septal","vessel":"RCA"}, {"segment_no":"rca_pda", "path":"m358.15 736.56c4.25 4.6667 8.5 6.6411 12.75 14l1.75 12.5-12.25 25.75-9.5 17.5-8.5 22.5-3.5 28",  "size":"2.2","name":"RCA PDA","vessel":"RCA"}, {"segment_no":"lcx_pda", "path":"m448.4 778.31-4.5 15-21 19.5-39 34.5-4.5 15.5", "size":"2.2","name":"LCX PDA ","vessel":"LCX"}, {"segment_no":"lcx_om1", "path":"m502.85 560.74-1.8601 6.9467-5.0103 39.6-3.8652 15.564-5.3004 25.243c-3.3618 5.9244 3.3706 29.349-4.0854 35.273l-6.5 36.712",  "size":"1.4","name":"LCX 1st OM","vessel":"LCX"}]




grafts_template = [ {"graft_proximal_anastomosis":"innominate","proximal_site":"Innominate Artery", "proximal_anastomosis_path":"m161.62 371.41l-10.32-16.73", "size":"4.8"}, {"graft_proximal_anastomosis":"mammary", "proximal_site":"Mammary", "proximal_anastomosis_path":"m568.17 353.51-8.6597 20.699", "size":"4.8"}, {"graft_proximal_anastomosis":"subclavian","proximal_site":"Subclavian Artery",  "proximal_anastomosis_path":"m530.22 354.18-7.995 20.035v0", "size":"4.8"}, {"graft_proximal_anastomosis":"asc_aorta_1","proximal_site":"Ascending Aorta, Position 1",  "proximal_anastomosis_path":"m198.44 443.32 10 10","size":"5.8"}, {"graft_proximal_anastomosis":"asc_aorta_2","proximal_site":"Ascending Aorta, Position 2", "proximal_anastomosis_path":"m221.16 433.32 10 10v0", "size":"5.8"}, {"graft_proximal_anastomosis":"asc_aorta_3", "proximal_site":"Ascending Aorta, Position 3","proximal_anastomosis_path":"m241.84 423.32 10 10", "size":"5.8"}, {"graft_proximal_anastomosis":"asc_aorta_4", "proximal_site":"Ascending Aorta, Position 4","proximal_anastomosis_path":"m260.48 421.96 10 10", "size":"5.8"}, {"graft_proximal_anastomosis":"asc_aorta_5", "proximal_site":"Ascending Aorta, Position 5","proximal_anastomosis_path":"m280.48 420.8 10 10", "size":"5.8"}, {"graft_proximal_anastomosis":"asc_aorta_6","proximal_site":"Ascending Aorta, Position 6", "proximal_anastomosis_path":"m299.12 420.8 10 10", "size":"5.8"}, {"graft_proximal_anastomosis":"desc_aorta","proximal_site":"Descending Aorta", "proximal_anastomosis_path":"m200 922.36 10-10", "size":"5.8"}]

t_grafts_template = [ {"graft_proximal_anastomosis":"t_graft_lima", "graft":"mammary","proximal_site":"Mammary", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_radial", "graft":"radial","proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_rima","graft":"innominate","proximal_site":"Innominate Artery",  "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_svg_1", "graft":"asc_aorta_1","proximal_site":"Ascending Aorta, Position 1", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_svg_2", "graft":"asc_aorta_2","proximal_site":"Ascending Aorta, Position 2", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_svg_3", "graft":"asc_aorta_3","proximal_site":"Ascending Aorta, Position 2", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_svg_4", "graft":"asc_aorta_4","proximal_site":"Ascending Aorta, Position 4", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_svg_5", "graft":"asc_aorta_5","proximal_site":"Ascending Aorta, Position 5", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_svg_6", "graft":"asc_aorta_6","proximal_site":"Ascending Aorta, Position 6", "proximal_anastomosis_path":"", "size":"5.8"}, {"graft_proximal_anastomosis":"t_graft_desc_aorta", "graft":"desc_aorta","proximal_anastomosis_path":"", "size":"5.8"} ]





collateral_nodes = new Array()
native_nodes = new Array()
graft_nodes = new Array()
t_graft_nodes = new Array()
all_tree_nodes = new Array()
all_tree_links = new Array()
nodes_count = 1


graft_segments_stenosis_template = new Array()
cor_info_template = [{"cor_angio_natives_normal":""},
                     {"dominance":""},
                     {"grafts_present":""},
                     {"total_grafts_implanted_number":""},
                     {"total_grafts_patent_number":""}  ]


class Utility


    parameters =
        A: 7
        a: 7
        C: 6
        c: 6
        H: 1
        h: 1
        L: 2
        l: 2
        M: 2
        m: 2
        Q: 4
        q: 4
        S: 4
        s: 4
        T: 2
        t: 2
        V: 1
        v: 1
        Z: 0
        z: 0

      parse_path:  (path) ->
        ret = []
        args = []
        curArg = ""
        foundDecimal = no

        for c in path
            params = parameters[c]
            if params?
                if cmd # save existing command
                    args[args.length] = +curArg if curArg.length > 0
                    ret[ret.length] = {cmd,args}
                    args = []
                    curArg = ""
                    foundDecimal = no
                cmd = c
            else if c in [" ", ","] or (c is "-" and curArg.length > 0) or (c is "." and foundDecimal)
                continue if curArg.length is 0
                if args.length is params # handle reused commands
                    ret[ret.length] =
                        command: cmd
                        args: args
                    args = [+curArg]
                    # handle assumed commands
                    cmd = "L" if cmd is "M"
                    cmd = "l" if cmd is "m"
                else
                    args[args.length] = +curArg
                foundDecimal = (c is ".")
                # fix for negative numbers or repeated decimals with no delimeter between commands
                curArg = if c in ['-', '.'] then c else ''
            else
                curArg += c
                foundDecimal = true if c is '.'
        # add the last command
        args[args.length] = +curArg if curArg.length > 0
        ret[ret.length] = {cmd,args}
        return ret

class Controls
      select_date: (cor_angio_info_id, cath_procedure_id, admission_id) ->
        alert("Under Construction Select Date ")
        #d3.select("#cor_tree_id").append("button")
        #    .attr("class", "origButton")
        #    .html("Select Date Of Angio").on("click", () ->
        #            alert("cor_tree_id"))

class Gradients
    blue: (group, id) ->
          gradient = group.append("defs").append("linearGradient")
            .attr("id", id)
            .attr("x1", "0%")
            .attr("y1", "20%")
            .attr("x2", "20%")
            .attr("y2", "100%");

          gradient.append("stop")
             .attr("offset", "20%")
             .attr("stop-color", "#ccf");

          gradient.append("stop")
              .attr("offset", "50%")
              .attr("stop-color", "#1C425C");

          gradient.append("stop")
              .attr("offset", "100%")
              .attr("stop-color", "#19162B")

          return gradient


    radial: (group, id, color_1, color_2) ->

        gradient_radial = group.append("svg:defs")
                .append("svg:radialGradient")
                .attr("id", id)
                .attr("cx", "50%")
                .attr("cy", "50%")
                .attr("fx", "50%")
                .attr("fy", "80%")
                .attr("spreadMethod", "pad")

        gradient_radial.append("svg:stop")
                .attr("offset", "0%")
                .attr("stop-color", color_1)
                .attr("stop-opacity", 1);

        gradient_radial.append("svg:stop")
                .attr("offset", "100%")
                .attr("stop-color", color_2)
                .attr("stop-opacity",0.7)

    stent_texture: (group, id, color_1,color_2) ->
        stent_gradient = textures.lines().stroke(color_1).strokeWidth(1).size(5).orientation("2/8");
        #circle1.style("fill", texture1.url());
        #t= textures.lines().thicker()
        group.append('g')
             .attr("id",id)

        group.call(stent_gradient)

        return



    linear: (group, id, color_1,color_2) ->
        gradient_linear = group.append("svg:defs")
                .append("svg:linearGradient")
                .attr("id", id)
                .attr("x","0%")
                .attr("y","0%")
                .attr("x2","100%")
                .attr("y2","100%")

        gradient_linear.append("svg:stop")
                .attr("offset", "0%")
                .attr("stop-color", color_1)
                .attr("stop-opacity", 1);


        gradient_linear.append("svg:stop")
                .attr("offset", "100%")
                .attr("stop-color", color_2)
                .attr("stop-opacity",0.7)
                .attr("gradientTransform", "rotate(45)")

    fe: ( group,id,color_1,color_2) ->

    grand: ( group,id,color_1,color_2) ->
        filter = group.append("svg:defs")
                  .append("svg:filter")
                  .attr("id", id)
                  .attr("id", "turbFilter1")
                  .attr("in", "SourceImage")
                  .attr("filterUnits", "objectBoundingBox");

        turb1 = filter.append("svg:feTurbulence")
                   .attr("baseFrequency", .5)
                   .attr("numOctaves", 4)
                   .attr("result", "turbulenceOut1");

        disp1 = filter.append("svg:feDisplacementMap")
                    .attr("in", "SourceGraphic")
                    .attr("in2", "turbulenceOut1")
                    .attr("xChannelSelector", "B")
                    .attr("yChannelSelector", "R")
                    .attr("scale", 2);

        diff1 = filter.append("svg:feDiffuseLighting")
                    .attr("in", "SourceGraphic")
                    .attr("diffuseConstant", 2)
                    .attr("surfaceScale", 200)
                    .attr("style", "lighting-color:"+color_1)
                    #.attr("style", "lighting-color:#99FFFF")
                    .append("svg:feSpotLight")
                    .attr("x", 30)
                    .attr("y", 10)
                    .attr("z", 80)
                    .attr("pointsAtX", 130)
                    .attr("pointsAtY", 230)
                    .attr("pointsAtZ", 0)
                    .attr("specularExponent", 4)
        return filter



    virtual_light: (group,id,color_1,color_2) ->

        light = group.append("svg:defs")
                  .append("svg:linearGradient")
                  .attr("id", id)
                  .attr("x","0%")
                  .attr("y","0%")
                  .attr("x2","0%")
                  .attr("y2","100%")

        light.append("svg:stop")
                .attr("offset", "0%")
                .attr("stop-color", color_1)
                .attr("stop-opacity",1)


        light.append("svg:stop")
                .attr("offset", "0.4")
                .attr("stop-color", color_2)
                .attr("stop-opacity",0)


    padded: (group, id, method, color_1, color_2, color_3) ->
        #   method: pad, reflect
        light = group.append("svg:defs")
                .append("svg:linearGradient")
                .attr("id", id)
                .attr("x1","45%")
                .attr("y2","55%")
                .attr("spreadMethod", method);

        light.append("svg:stop")
                .attr("offset", "0%")
                .attr("stop-color", color_1)
                .attr("stop-color", color_1)
                .attr("stop-opacity", 1);

        light.append("svg:stop")
                .attr("offset", "50%")
                .attr("stop-color", color_2)
                .attr("stop-opacity", 1);

        light.append("svg:stop")
                .attr("offset", "100")
                .attr("stop-color", color_3)
                .attr("stop-opacity", 1);

    pattern: (group, id, color_1, color_2 ) ->
        pattern =   group.append('defs')
            .append('pattern')
            .attr('id', id)
            .attr('patternUnits', 'userSpaceOnUse')
            .attr('width', 20)
            .attr('height', 20)
            #.attr("patternTransform", "scale(2,4) rotate(45)")


        pattern.append("rect")
            .attr("width", 20)
            .attr("height", 20)
            .style("fill", color_1)
            .attr("stroke","none")
            .style('stroke-width', 0.1);

        #pattern.append("line")
        #       .attr("x1",0)
        #       .attr("y1",0)
        #       .attr("x2",10)
        #       .attr("y2",10)
        #       .attr("stroke",color_2)
        #       .attr("stroke-width",3)


        #pattern.append("line")
        #       .attr("x1",10)
        #       .attr("y1",0)
        #       .attr("x2",0)
        #       .attr("y2",10)
        #       .attr("stroke",color_2)
        #       .attr("stroke-width",2)


        pattern.append("path")
            .attr("d", "M0,5 L20,5 M5,0 L5,20 M0,15 L20,15 M15,0 L15,20")
            .attr("stroke",color_2)
            .attr("stroke-width",1)


        ###
        pattern.append("rect")
            .attr("width", 20)
            .attr("height", 20)
            .style('fill', color_1)

        pattern.append("rect")
            .attr("width", 10)
            .attr("height", 10)

        pattern.append("rect")
            .attr("width", 10)
            .attr("height", 10)
            .attr("x",10)
            .attr("y",10)
            .style('fill', "navy")

        pattern.append("path")
            .attr("d", "M0,5 L20,5 M5,0 L5,20 M0,15 L20,15 M15,0 L15,20")
            .attr("stroke","levander")
        ###




                #.attr("patternTransform", "rotate(-45)")


          #pattern = light.append("pattern")
          # .attr({ id:"stent_gradient", width:"8", height:"8", patternUnits:"userSpaceOnUse", patternTransform:"rotate(-45)"})
            #.attr("fill",color_1)
            # .append("rect")

           #.attr({ width:"4", height:"8", transform:"translate(0,0)", fill:"red" });



class Cylinder

  #ellipses2.on("mouseover",function(d,i){ d3.select(this).transition().ease("elastic").duration(1000).attr("cy",(i+2)*75);
 #        d3.select("#rect"+i).transition().ease("elastic").duration(1000).attr("height",410-(i+2)*75).attr("y",(i+2)*75);
 #        d3.select("#rect2"+i).transition().ease("elastic").duration(1000).attr("height",410-(i+2)*75).attr("y",(i+2)*75);
 #       d3.select(this).transition().delay(1000+(i+1)*300).duration((i+1)*600).attr("cy",410);
 #        d3.select("#rect"+i).transition().delay(1000+(i+1)*300).duration((i+1)*600).attr("height",0).attr("y",410);
 #        d3.select("#rect2"+i).transition().delay(1000+(i+1)*300).duration((i+1)*600).attr("height",0).attr("y",410);
 #}

class Background_grid
    constructor: (svg)  ->
        @svg = svg


    set_grid: () ->
        pattern =   @svg.append('defs')
            .append('pattern')
            .attr('id', 'grid_pattern')
            .attr('patternUnits', 'userSpaceOnUse')
            .attr('width', 10)
            .attr('height', 10)

        pattern.append("rect")
            .attr("width", 10)
            .attr("height", 10)
            .style("fill",  'none')
            .style('stroke', '#fff')
            .style('stroke-width', 0.1);

        grid = @svg.append("rect")
            .attr('id','big_grid_rect')
            .attr("x", 5)
            .attr('y',0)
            .attr('rx',5)
            .attr('ry',5)
            .attr("width", '95%')
            .attr("height", '100%')
            .attr('fill', 'url(#grid_pattern)')
            .style('stroke', 'gray')
            .style('stroke-width',2);
        return grid

class Setup

    x = d3.scale.linear()
            .domain([0, 900])
            .range([0, 900]);

    y = d3.scale.linear()
            .domain([0, 1100])
            .range([1100, 0]);

    svg: ()->
        id =  global_vars.cor_angio_info_id
        vessel = d3.select("#cor_tree_content"+id)
        vessel.append("svg:svg")
        #.attr({"width": "100%","height": "95%" })
        #.attr("viewBox", "0 0 " + 800 + " " + 1000 )
        .attr({"width": "98%","height": "95%" })
        .attr("viewBox", "0 0 " + 1000 + " " + 1200 )
        .attr("preserveAspectRatio", "xMidYMid meet")
        .attr("pointer-events", "all")
        .style("margin-left","0%")
        .style("margin-right","0%")
        .style("margin-top","0%")
        .style("margin-bottom","0%")
        .style("background-color","#000")
        .style("cursor","move")
        .style("shape-rendering", "crispEdges")
        .call(@zoom())

    zoom: ()->
        d3.behavior.zoom()
            .scaleExtent([1,  100])
            .on("zoom", @redraw)

    vis: ()  ->
        @svg().append('svg:g')
              .attr('id','svg_vis')


    scale_normal: () ->
            zoom = @zoom()
            zoom.scale(1);
            zoom.translate([0, 0])
            @redraw()

    redraw: ()  ->
        trans=d3.event.translate
        scale=d3.event.scale
        vis = d3.select('#svg_vis')
                .attr("align", "center")
        vis.attr("transform", "translate(" + trans + ")" + " scale(" + scale + ")")

    #geo_vis: () ->
    #     @svg().append('svg:g')
    #          .attr('id','geo_svg_vis')


_const =
    vessel_bg: 'red'
    stroke_color: '#fff'
    fill: 'yellow'
    diverge_color: ["white","cyan","pink","yellow","green","white","black","white","grey","white","darkorchid","darkred"]
    rca_ostium_x: 297.69
    rca_ostium_y: 538.09
    lm_ostium_x: 368.3
    lm_ostium_y: 504.55
    lm_ostium_color: "#08519c"
    lm_ostium_stroke_color:"#c6dbef"
    rca_ostium_color: "#08519c"
    rca_ostium_stroke_color:"#c6dbef"
    show_segment_color: "#fff7ec"
    start_translate: 'translate(100px,-35px)';
    end_translate: 'translate(0px,0px)';
    col_start_translate: 'translate(0px,65px)';
    col_end_translate: 'translate(0px,0px)';
    tree_width: 1000
    tree_height:1200
    stenosis_size: 50



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
    #vein_colors : colorbrewer.RdYlBu[6]
    vein_colors : colorbrewer.YlOrBr[6]

    #range_colors: colorbrewer.Set2[6]
    #range_colors: colorbrewer.Set3[6]
    #range_colors: colorbrewer.Accent[6]
    #range_colors: colorbrewer.Purples[6]
    #range_colors: colorbrewer.Set1[6].reverse()

    #range_colors: colorbrewer.Greys[7]
    range_colors: ["url(#vessel_gradient)",'#c6dbef','#9ecae1','#6baed6','#3182bd','#08519c']

    #range_colors:["url(#vessel_gradient)",'#bae4b3','#74c476','#31a354','#006d2c']
    #range_colors: ["url(#vessel_gradient)",'#cccccc','#969696','#636363','#252525']##black -white
    #range_colors: ["url(#vessel_gradient)",'#f0f0f0','#bdbdbd','#636363']
    #range_colors: ['#feedde','#fdd0a2','#fdae6b','#fd8d3c','#f16913','#d94801','#8c2d04']
    #range_colors: ['#f7f7f7','#cccccc','#969696','#525252']
    #range_colors: ["url(#vessel_gradient)",'#a6dba0']




class Lesion
      show:  (d, node, selector) ->
        property = new Segment_property()

        n0 = node.getTotalLength()
        p1 = node.getPointAtLength(n0*0.50)
        p_x = p1.x
        p_y = p1.y

        a_group = selector.append("g")
             .attr('transform', (d) ->
                      return "translate("+ p_x + ","+ p_y + ")")

        diamond = a_group.append("path")
            .attr("d", d3.svg.symbol()
            .size((d) -> return d.size*1.7)
            .type( (d) -> return "diamond" ) )

        diamond.style("stroke-width", d.size*0.2)
              .style("stroke","#f89406")
              .style("fill", (d) ->
                   return "#bcd7e5"
                )
              .style("opacity",0.5)
        #stenosis =  d.percent_stenosis
        #size = d.size*1.7

        #text_group = property.text(a_group, size, "white")
        #        .attr('transform', (d) ->
        #              return "translate("+ 10 + ","+ 10 + ")")

        #text_group.text((d) -> return  stenosis + " % ")
        return a_group

      show_text: (group, point, color, path) ->

        a_text = group.append('text')
            .attr("dx", point.x+18+"px")
            .attr("dy", point.y+"px")
            .attr("fill", color)
            .attr("text-anchor","middle")
            .style("font-family", "sans, georgia, times")
            .style("font-size", "0.65em")
            .style("font-weight","normal")
            .style("stroke","none")
            #.attr("transform", translate)
        return a_text

      show_rain_drop: (size) ->
        r = Math.sqrt(size / Math.PI)
        drop = "M" + r + ",0" + "A" + r + "," + r  + " 0 1,1 " + -r + ",0" + "C" + -r + "," + -r  + " 0," + -r + " 0," + -3*r + "C0," + -r + " "  + r + "," + -r + " " + r + ",0" + "Z"

        return drop


      circle_xy: (angle,radius) ->
        points=[]
        x = Math.cos(angle) * radius
        y = Math.sin(angle) * radius
        points = {"x": x,"y": y}

        return points

      polygon:  (sides, size, radius, center) ->
        circle = 2 * Math.PI
        angle = circle / sides
        points = []

        for i in [0..sides-1]
          x = (Math.cos(angle * i) * size) + center[0]
          y = (Math.sin(angle * i) * size) + center[1]
          points[i] = {"x": x, "y": y, "r": radius}

        return points



      shape2: (group) ->
          return group

      percent2: (group) ->




class Segment_property

    normal_shape: (path) ->
      return path

    shape_diamond: (svg,size) ->
        group = svg.append('g')
            .attr("id","shape")
            .style("cursor","pointer")

        diamond = group.append("path")
            .attr("d", d3.svg.symbol()
            .size((d) -> return 45 * 45)
            .type( (d) -> return "diamond" ) )

        diamond.style("stroke-width", 0.5)
            .style("stroke","#fdae6b")
            .style("fill", (d) ->
                 return "#fee6ce"
              )
            .style("opacity",0.4)


        return group

    test_shape2: (path, segment_no) ->
      selector = d3.select("#"+segment_no)
      circle = selector.append("circle")
                       .attr("dx", 5 )
                       .attr("dy", 5)
                       .attr("r", 10)

      return  path

    unique_id: () ->
       return '_' + Math.random().toString(36).substr(2, 9);

    color: (element) ->
      gradients = new Gradients()
         ################NATIVES COLOR

      frame_element =  d3.selectAll( "#frame_element")

      frame_gradient =  gradients.radial(element, "frame_gradient", "#757575","#efedf5")
      #frame_gradient = gradients.padded(element, "frame_gradient", "#bcbddc","#756bb1", "#efedf5")

      ################NATIVES COLOR

      native_element =  d3.selectAll( "#native_group_enter")
               .select(".native")

      native_gradient = gradients.radial(element, "vessel_gradient", "#f0f0f0","#bdbdbd")

      native_fill_color = d3.scale.quantize()
               .domain([0,100])
               .range( _const.range_colors)
               #.range(colorbrewer["GrBlu"])
               #.range(_const.brewer_greys)
      native_color = native_element
               .attr("fill", "none")
               .attr('stroke', (d)  ->
                     native_fill_color(d.percent_stenosis) )

      ######################STENT COLOR

      stent_element =  d3.selectAll("#native_group_enter")
               .select(".stent")

      #stent_gradient =  gradients.linear(element, "stent_gradient", "#e6550d","#fdae6b")
      #stent_gradient =  gradients.padded(element, "stent_gradient", 'pad', "lightSteelBlue","darkRed","salmon")
		 // stent_gradient =  gradients.linear(element, "stent_gradient", "#92c5de","#0571b0")
 stent_gradient =  gradients.stent_texture(element, "stent_gradient", "#92c5de","#0571b0")
      #stent_gradient =  gradients.pattern(element, "stent_gradient", "#e9a3c9","#f7f7f7")

      stent_color = stent_element
               #.attr("fill", "url(#stent_gradient)" )
               .attr("fill", "none")
               .attr('stroke',  "url(#stent_gradient)")

      #################### GRAFTS COLOR ##########
      ##################LESION

      lesion_element =  d3.selectAll("#native_group_enter")
               .select(".lesion")

      lesion_gradient =  gradients.radial(element, "lesion_gradient", "#f4a582","#ca0020")
      lesion_color = lesion_element
               .attr("fill", "none")
               .attr('stroke',  "url(#lesion_gradient)")

      #################### GRAFTS COLOR ##########

      graft_element =  d3.selectAll( "#graft_group_enter")
               .select(".grafted")

      graft_gradient = gradients.linear(element, "graft_gradient", "#f0f0f0","#bdbdbd")

      graft_color = graft_element
               #.attr("fill", "url(#stent_gradient)" )
               .attr("fill", "none")
               .attr('stroke',  "url(#graft_gradient)")


      #arterial_gradient = gradients.linear(element, "arterial_gradient", "#d94701","white")
      arterial_gradient = gradients.linear(element, "arterial_gradient", "#d94701","white")

      vein_gradient = gradients.radial(element, "vein_gradient", "#6baed6","white")
      #veint_gradient =  gradients.padded(element, "vein_gradient","pad", "blue","#bdbdbd","#6baed6")


      ###################### GRAFT SEGMENTS COLOR ######################
      graft_segment_element =  d3.selectAll( "#segment_group_enter")
               .select(".grafted")

      graft_segment_gradient = gradients.linear(element, "graft_segment_gradient", "red","white")

      graft_segment_color =  graft_segment_element
               #.attr("fill", "url(#stent_gradient)" )
               .attr("fill",  "url(#graft_segment_gradient)")
               .attr('stroke',  "url(#graft_segment_gradient)")

      #graft_fill_color = d3.scale.quantize()
      #         .domain([0,100])
      #         .range( _const.vein_colors)
      #         #.range(colorbrewer["GrBlu"])
      #         #.range(_const.brewer_greys)

      #graft_color = graft_element
      #         .attr("fill", "none")
      #         .attr('stroke', (d)  ->
      #               graft_fill_color(1) )


      return




    title: (element) ->
        a_title = element.append("title")
            .style("font", "sans-serif")
            .style("font-size", "0.95em")
            .style("text-align", "center")
            .style("background-color", "cyan")

        return a_title

    text: (element,size,color) ->
       a_text = element.append("text")
            .attr("dx", (d) -> return 5 )
            .attr("dy", (d) -> return -5)
            .attr("fill", color)
            .attr("text-align", "center")
            .attr("text-anchor","middle")
            .style("font-family", "sans-serif")
            .style("font-size", size)
            .style("font-weight","normal")
            .style("opacity","0.5")
            .style("stroke","none")

       return a_text




class  Guides
    property = new Segment_property()

    make_bullets: (svg) ->
       start_x = 25
       start_y = 25

       rect = svg.append('rect')
         .attr("id","frame_element")
         .attr("x",start_x)
         .attr("y",start_y)
         .attr("rx",12.5)
         .attr("ry",12.5)
         .attr("width",950)
         .attr("height",1150)
         .attr("stroke-width",25)
         .style("stroke", "url(#frame_gradient)")


       text=  svg.append("text")
            .attr("dx", start_x+475+"px")
            .attr("dy", start_y+70+"px")
            .attr("fill", 'url(#frame_gradient)')
            .attr("text-anchor","middle")
            .style("font-family", "impact, georgia, times, sans")
            .style("font-size", "2.0em")
            .style("font-weight","normal")
            .style("opacity","0.9")
            .style("stroke","none")
            .text("Coronary Diagram")



       bullets_group = svg.append('g')
         .attr('transform', (d,i) ->
                      return "translate(0, 0)")

       rca_bullet = bullets_group.append("circle")
         .attr("cx", _const.rca_ostium_x + 15)
         .attr("cy", _const.rca_ostium_y - 5)
         .attr("r", 5.0)
         .style("stroke-width",1)
         .style("stroke", "url(#stent_gradient)")
         .style("fill",  "url(#vessel_gradient)");

       lm_bullet = bullets_group.append("circle")
         .attr("cx", _const.lm_ostium_x - 15)
         .attr("cy", _const.lm_ostium_y - 2.5)
         .attr("r", 5.0)
         .style("stroke-width",1)
         .style("stroke","url(#stent_gradient)")
         .style("fill",  "url(#vessel_gradient)");

       #path = d3_path.path();
       #path.moveTo(100, 100);
       #path.lineTo(300, 400);
       #path.closePath();
       #arc = d3_shape.arc()
       #     .innerRadius(0)
       #     .outerRadius(100)
       #     .startAngle(0)
       #     .endAngle(Math.PI / 2);
       #console.log(arc)



       #path.attr("stroke-width",20)
       #    .attr("stroke","red")

       return bullets_group
###########################################
class Calc_paths
      construct_element:  (segment, div_id, start, end, element) ->
        seg_path =  d3.select("path#"+div_id).node()
        n0 = seg_path.getTotalLength()

        start_from = n0*start
        stop_to = n0*end

        all_points = new Array()

        i = start_from
        while i < stop_to
          #point = seg_path.getPointAtLength(n0*(start+step*i))
          point = seg_path.getPointAtLength(i)
          all_points.push("x":point.x,"y":point.y)
          i++


        line =  d3_shape.line()
            .x((d) -> return d.x )
            .y( (d) -> return d.y )
            #.curve(d3_shape.curveCatmullRom.alpha(0.1));
            #.curve(d3_shape.curveBundle);
            #.curve(d3_shape.curveMonotoneY);
            .curve(d3_shape.curveNatural);

        element_path = line(all_points)
        if element is "lesion"
          for node in native_nodes
            if node['segment'] is segment
              if node.div_id is segment + "_" + "lesion"
                 node.lesion_points = all_points[0]
        else if element is "stent"
          for node in native_nodes
            if node['segment'] is segment
              if node.div_id is segment + "_" + "stent"
                 node.stent_points = all_points[0]




        return element_path



      collateral_origin_path: (native_segment, div_id) ->
        #seg_path =  d3.select("path#"+ d.segment + "_" +"start").node()
        seg_path = d3.select("path#"+div_id).node()

        n0 = seg_path.getTotalLength()
        p5 = seg_path.getPointAtLength(n0*0.95)
        p6 = seg_path.getPointAtLength(n0*1.0)

        all_points = [{"x":p5.x, "y":p5.y},
                     {"x":p6.x, "y":p6.y}]

        line =  d3_shape.line()
            .x((d) -> return d.x )
            .y( (d) -> return d.y )
            .curve(d3_shape.curveCatmullRom.alpha(0.1));
            #.curve(d3_shape.curveBundle);
            #.curve(d3_shape.curveMonotoneY);
            #.curve(d3_shape.curveNatural);


        for a_col in collateral_nodes
            if a_col.col_from_segment_no is native_segment
                  col_graft_path = line(all_points  )
                  a_col.from_path = col_graft_path

            else if a_col.col_to_segment_no is native_segment
                  col_graft_path = line(all_points  )
                  a_col.to_path = col_graft_path


        return





      #collateral_path: (d) ->
      collateral_path: (start_div, end_div) ->
         #from_path = d3.select("path#col_from_segment_no"  + d.col_from_segment_no).node()
         #to_path =   d3.select("path#" + d.col_to_segment_no).node()
         #via_path =  d3.select("path#col_via_segment_no"+d.col_via_segment_no).node()
         from_path =    start_path = d3.select("path#"+start_div).node()
         to_path =    start_path = d3.select("path#"+end_div).node()

         n1 = from_path.getTotalLength()
         p1 = from_path.getPointAtLength(n1*0.90)

         n2 = to_path.getTotalLength()
         p2 = to_path.getPointAtLength(n2*0.90)

         distance = Math.sqrt( Math.pow((p2.x - p1.x), 2) +  Math.pow((p2.y - p1.y), 2))

         point_at_20 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.2)
         point_at_40 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.4)
         point_at_60 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.6)
         point_at_80 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.8)
         point_at_90 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.9)

         path_all_points = [{"x":p1.x, "y":p1.y},
                     {"x":point_at_20.x+5, "y":point_at_20.y-4},
                     {"x":point_at_40.x-5, "y":point_at_40.y+14},
                     {"x":point_at_60.x+5, "y":point_at_60.y-4},
                     {"x":point_at_80.x-5, "y":point_at_80.y+4},
                     {"x":point_at_90.x+5, "y":point_at_90.y+14},
                     {"x":p2.x, "y":p2.y}]



         line =  d3_shape.line()
                  .x((d) -> return d.x )
                  .y( (d) -> return d.y )
                  .curve(d3_shape.curveCatmullRom.alpha(0.1));
                  #.curve(d3_shape.curveBundle);
                  #.curve(d3_shape.curveMonotoneY);
                  #.curve(d3_shape.curveNatural);

         col_path = line(path_all_points)
         return col_path


       create_a_path: (p1, p2) ->
          distance = Math.sqrt( Math.pow((p2.x - p1.x), 2) +  Math.pow((p2.y - p1.y), 2))


          point_at_05 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.05)
          point_at_10 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.1)
          point_at_20 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.2)
          point_at_30 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.3)
          point_at_40 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.4)
          point_at_50 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.5)
          point_at_60 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.6)
          point_at_70 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.7)
          point_at_75 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.75)
          point_at_80 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.8)
          point_at_90 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.9)
          point_at_95 = @find_points(p1.x, p2.x, p1.y, p2.y, distance*0.95)

          path_all_points = [{"x":p1.x, "y":p1.y},
                     {"x":point_at_05.x-4, "y":point_at_05.y-2},
                     {"x":point_at_10.x+8, "y":point_at_10.y-4},
                     {"x":point_at_20.x+12, "y":point_at_20.y-2},
                     {"x":point_at_30.x+10, "y":point_at_30.y-3},
                     {"x":point_at_40.x+8, "y":point_at_40.y-2},
                     {"x":point_at_50.x+4, "y":point_at_50.y-2},
                     {"x":point_at_60.x-5, "y":point_at_60.y-2},
                     {"x":point_at_70.x+8, "y":point_at_70.y-2},
                     {"x":point_at_75.x+0, "y":point_at_75.y-2},
                     {"x":point_at_80.x-2, "y":point_at_80.y-2},
                     {"x":point_at_90.x+2, "y":point_at_90.y-2},
                     {"x":point_at_95.x-5, "y":point_at_95.y-2},
                     {"x":p2.x, "y":p2.y}]


          return path_all_points






       t_graft_path: (graft, start_div, end_div) ->
          start_path = d3.select("path#"+start_div).node()
          n1 = start_path.getTotalLength()
          p1 = start_path.getPointAtLength(n1*0.75)

          end_path =  d3.select("path#" + end_div).node()
          n2 = end_path.getTotalLength()
          p2 = end_path.getPointAtLength(n2*0.60)
          path_all_points = @create_a_path(p1, p2)
          line =  d3_shape.line()
                  .x((d) -> return d.x )
                  .y( (d) -> return d.y )
                  #.curve(d3_shape.curveCatmullRom.alpha(0.3));
                  #.curve(d3_shape.curveBundle)
                  #.curve(d3_shape.curveCardinal)
                  #.curve(d3_shape.curveMonotoneY);
                  .curve(d3_shape.curveNatural);


          graft_path = line(path_all_points)
          @a_store_graft_lesion_paths(graft, t_graft_nodes, path_all_points)


          return graft_path


       graft_path: (graft, start_div, end_div) ->

          #start_from = n0*start
          #stop_to = n0*end

          # the data d ae grafts_template
          #start_path =  d3.select("path#graft"+d.graft_proximal_anastomosis).node()
          start_path = d3.select("path#"+start_div).node()
          n1 = start_path.getTotalLength()
          p1 = start_path.getPointAtLength(n1*0.75)

          end_path =  d3.select("path#" + end_div).node()
          n2 = end_path.getTotalLength()
          p2 = end_path.getPointAtLength(n2*0.60)
         
				 path_all_points = @create_a_path(p1, p2)
          ###
          i = 0.01
          new_points = new Array()
          plus = 4
          minus = 2
          while i < 1.0
            point_at  =  @find_points(p1.x, p2.x, p1.y, p2.y, distance*i)
            new_points.push("x":point_at.x,"y":point_at.y)
            i = i + 0.01
          ###
          #path_all_points.push({"x":p2.x, "y":p2.y})
          line =  d3_shape.line()
                  .x((d) -> return d.x )
                  .y( (d) -> return d.y )
                  #.curve(d3_shape.curveCatmullRom.alpha(0.3));
                  #.curve(d3_shape.curveBundle)
                  #.curve(d3_shape.curveCardinal)
                  #.curve(d3_shape.curveMonotoneY);
                  .curve(d3_shape.curveNatural);


          graft_path = line(path_all_points)
          #graft_path = line(new_points)
          @a_store_graft_lesion_paths(graft, graft_nodes, path_all_points)
          @store_t_graft_origin_path(graft, path_all_points)

          return   graft_path


      store_t_graft_origin_path: (graft, path_all_points) ->
        t_origin_points = path_all_points[3..4]

        line =  d3_shape.line()
                  .x((d) -> return d.x )
                  .y( (d) -> return d.y )
                  .curve(d3_shape.curveCatmullRom.alpha(0.3));
                  #.curve(d3_shape.curveBundle)
                  #.curve(d3_shape.curveCardinal)
                  #.curve(d3_shape.curveMonotoneY);
                  #.curve(d3_shape.curveNatural);

        t_origin_path = line(t_origin_points)

        for node in all_tree_nodes['t_grafts']
              if node['starting_graft'] is graft
                   node.start_path = t_origin_path

        for node in graft_nodes
              if node['starting_graft'] is graft
                   node.start_path = t_origin_path




      a_store_graft_lesion_paths: (graft, nodes_storage, path_all_points) ->
          start_points = path_all_points[0..1]
          ostial_points = path_all_points[1..2]
          proximal_points = path_all_points[3..4]
          mid_points = path_all_points[5..6]
          distal_points = path_all_points[7..8]
          distal_anastomosis_points = path_all_points[12..13]
          end_points = path_all_points[12..13]


          line =  d3_shape.line()
                  .x((d) -> return d.x )
                  .y( (d) -> return d.y )
                  .curve(d3_shape.curveCatmullRom.alpha(0.3));
                  #.curve(d3_shape.curveBundle)
                  #.curve(d3_shape.curveCardinal)
                  #.curve(d3_shape.curveMonotoneY);
                  #.curve(d3_shape.curveNatural);

          ostial_path = line(ostial_points)
          proximal_path = line(proximal_points)
          mid_path = line(mid_points)
          distal_path = line(distal_points)
          distal_anastomosis_path = line(distal_anastomosis_points)


          for node  in all_tree_nodes
             if node['segment'] is graft
                 if node.div_id is graft + "_" + "start"
                    node.points = start_points[0]


                if node.div_id is graft + "_" + "ostial"
                   node.path = ostial_path
                   node.points = ostial_points[0]

                if node.div_id is graft + "_" + "proximal"
                   node.path = proximal_path
                   node.points = proximal_points[0]

                if node.div_id is graft + "_" + "mid"
                      node.path = mid_path
                      node.points = mid_points[0]

                if node.div_id is graft + "_" + "distal"
                      node.path = distal_path
                      node.points = distal_points[0]

                if node.div_id is graft + "_" + "distal_anastomosis"
                      node.path = distal_anastomosis_path
                      node.points = distal_anastomosis_points[0]

               if node.div_id is graft + "_" + "end"
                      node.points = end_points[0]



           for node in  nodes_storage
             if node['segment'] is graft
                 if node.div_id is graft + "_" + "start"
                      node.points = start_points[0]

                if node.div_id is graft + "_" + "ostial"
                      node.path = ostial_path
                      node.points = ostial_points[0]
                if node.div_id is graft + "_" + "proximal"
                      node.path = proximal_path
                      node.points = proximal_points[0]
                if node.div_id is graft + "_" + "mid"
                      node.path = mid_path
                      node.points = mid_points[0]
                if node.div_id is graft + "_" + "distal"
                      node.path = distal_path
                      node.points = distal_points[0]
                if node.div_id is graft + "_" + "distal_anastomosis"
                      node.path = distal_anastomosis_path
                      node.points = distal_anastomosis_points[0]
                if node.div_id is graft + "_" + "end"
                      node.points = end_points[0]

          return



      test_graft_segments_path: (d) ->
          values = d.vessel_path
          segments = []
          i = 0
          n = values.length
          while (++i < n)
            segments.push([[i - 1, values[i - 1]], [i, values[i]]])

          return segments;


      find_mid_point: (p1_x, p1_y, p2_x, p2_y) ->
        mid_point_x = p1_x + (p2_x - p1_x) / 2
        mid_point_y = p1_y + (p2_y - p1_y) / 2

        mid_point = {"x":mid_point_x, "y":mid_point_y}
        return mid_point



      find_points: (p1_x, p2_x, p1_y, p2_y,  at_distance) ->
          angle = Math.atan2(p2_y- p1_y, p2_x - p1_x)

          sin = Math.sin(angle) * at_distance
          cos = Math.cos(angle) * at_distance


          p_y = p1_y + sin
          p_x = p1_x + cos

          a_point = new Array()

          a_point = {"x":p_x, "y":p_y}




##############################################

class Draw_grafts
   constructor: (patient_data, group) ->
     @patient_data = patient_data
     @group = group

   lesion = new Lesion()

   make_origins: () ->
    property =  new  Segment_property()
    calc = new Calc_paths()


    vessel_group = @group.append('g')
      .selectAll('g')
      .attr('id',"graft_group")
      .data(@patient_data)

    group_enter = vessel_group
      .enter()
      .append('g')
      .attr('id','graft_group_enter')

    paths = group_enter.append("path")
      .attr("id", (d) -> d.div_id)
      .attr("class",  (d) -> "graft")
      .attr("d",  (d) ->
                  d.start_path
        )
      .attr("stroke-width", (d) ->   d.size*0.4 )
      .style("stroke","gray")
      .style("stroke-linecap","round")
      .style("fill","none")
      .style("stroke-join","round")
       #.attr("opacity", 0.6)
      .attr("opacity", (d) ->
               return 0.6
          )


    return group_enter


   make_ends: (group_enter) ->
      calc = new Calc_paths()
      grafts_group = group_enter.append("path")
         .attr("id", (d) -> d.div_id+"_"+"end")
         #.attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "grafted")
         .attr("d",  (d) ->
             if d.end_path?
               d.end_path
          )
         .attr("stroke-width", (d) ->   d.size )
         .style("stroke", (d) ->
             return "none"
             #return "url(#vein_gradient)"
          )
         .style("fill","none")
         .style("stroke-linecap","round")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
             #if d.graft_distal_anastomosis_segment_no != "0"
                0.0
              #else
              #  0.0
               )

      return group_enter




   make_grafts: (group_enter) ->
      calc = new Calc_paths()
      grafts_group = group_enter.append("path")
         .attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "grafted")
         .attr("d",  (d) ->
           if d.end_path?
                start_div = d.segment + "_" + "start"
                end_div =  d.div_id+"_"+"end"
                graft = d.segment
                path = calc.graft_path(graft, start_div, end_div)
                path
          )
         .attr("stroke-width", (d) ->   d.size )
         .style("stroke", (d) ->
             if d.graft_type != 'vein'
                #return  graft_texture.url()
                return "url(#arterial_gradient)"
              else
                return "url(#vein_gradient)"
          )
         .style("fill","none")
         .style("stroke-linecap","round")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
                #if d.graft_distal_anastomosis_segment_no != "0"
                0.9
                #else
                #  0.0
               )


      percent_scale = d3.scale.linear()
            .domain([0,100])
            .range([0, _const.stenosis_size]);

      #percent_scale = d3.scale.linear()
      #      .domain([d3.min(graft_nodes, (d) -> return d['percent_stenosis']; ),
      #        d3.max(graft_nodes, (d) -> return d['percent_stenosis']; )])
      #      .range([0,stenosis_height]);


      lesions_group = group_enter.append('g')
           .attr('transform', (d) ->
                      if d.percent_stenosis isnt ""
                        size = percent_scale(d.percent_stenosis)

                        return "translate("++ (d.points.x - d.size*3 ) + ","+ d.points.y + ")"
           )

      #@radius_scale = d3.scale.pow().exponent(0.5).domain([0, max_amount]).range([2, 85])

      radius_scale = d3.scale.pow().exponent(0.5)
              .domain([d3.min(graft_nodes, (d) -> return d['percent_stenosis']; ),
                d3.max(graft_nodes, (d) -> return d['percent_stenosis']; )])
              .range([0, _const.stenosis_size])

      make_graft_lesions = lesions_group.append("path")
         .attr("id", (d) -> d.div_id+"rain_drop")
         .attr("class",  (d) -> "rain_drop")
         .attr("d",  (d) ->
             if d.percent_stenosis isnt ""
                size = percent_scale(d.percent_stenosis)
                #size2 = radius_scale(d.percent_stenosis)
                lesion.show_rain_drop(size)

          )
         .style("fill","url(#lesion_gradient)")
         .style("stroke","none")
         .attr("opacity", (d) ->
                  if d.percent_stenosis isnt ""
                       return 0.9
                  else
                    return 0.0 )

         .attr('transform', (d) ->
                      if d.percent_stenosis isnt ""
                        return "rotate(90)")

      ###
      lesions_group.append("text")
            .attr("id", "curve-text")
            .append("textPath")
            .attr("class", "textpath")
            .attr("xlink:href",(d) -> "#"+d.div_id+"rain_drop")
            .style("font-family", "sans-serif")
            .style("font-size", (d) ->
             if d.percent_stenosis > 0
                return "0.85em"
               )
            .style("font-weight","normal")
            .style("opacity","0.8")
            .style("stroke","none")
            .style("fill","orange")
            .text((d) ->
                  if d.percent_stenosis isnt ""
                     d.percent_stenosis + "(%)"
             )


      lesions_group.append("use")
          .attr("id", "curve-line")
          .attr("xlink:href", (d) -> "#"+d.div_id+"rain_drop");
      ###


      graft_lesions_text_group = group_enter.append("text")
            .attr("x", (d) ->
                    if d.points.x isnt ""
                        d.points.x  + d.size*1.1)
            .attr("y", (d) ->
                   if d.points.y isnt ""
                        d.points.y - (d.size)
                )
            .attr("fill", "orange")
            .attr("text-align", "center")
            .attr("text-anchor","start")
            #.attr("text-anchor", (d) ->
            #    console.log("d.points.x: "+d.points.x)
            #    if (d.points.x < 180)
            #        return  "start"
            #    else
            #        return "end"; )
            #.attr("transform", (d) ->
            #    if(d.points.x < 180 )
            #        return "translate(8)"
            #    else
            #        return "rotate(180)translate(-8)" )
            .style("font-family", "sans-serif")
            .style("font-size", "0.65em")
            .style("font-weight","normal")
            .style("opacity","0.9")
            .style("stroke","none")
           .text((d) ->
                  if d.percent_stenosis isnt ""
                     d.percent_stenosis + " (%) "
             )

      graft_lesions_title = lesions_group.append('title')

      graft_lesions_title.append('text')
                   .text((d) -> "Stenosis "+ d.percent_stenosis +  " "+  "(%)" + " In The " + d.official_name + " "+"Part")



      over = grafts_group.on('mouseover', (d) ->
          d3.select(this)
              .transition()
              .duration(1500)
              .attr("stroke-width", (d) -> d.size * 1.6)
              .attr("cursor","pointer") )
              .attr("stroke","yellow")


      out = grafts_group.on('mouseout', (d) ->
        d3.select(this)
            .transition()
            .duration(500)
            .attr("stroke-width", (d) ->  d.size  )
            .attr("cursor","move"))


      return group_enter






class Draw_t_grafts
   constructor: (data, group) ->
     @data = data
     @group = group


   make_origins: () ->
        property =  new  Segment_property()

        vessel_group = @group.append('g')
            .selectAll('g')
            .attr('id',"t_graft_group")
            .data(@data)


        group_enter = vessel_group
                    .enter()
                    .append('g')
                    .attr('id','t_graft_group_enter')

        paths = group_enter.append("path")
         .attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "t_graft")
         .attr("d",  (d) ->
                    d.start_path
          )
         .attr("stroke-width", (d) ->   d.size *0.2 )
         .style("stroke", (d) ->
             if d.graft_type != 'vein'
               return "url(#vein_gradient)"
             else
                return "url(#arterial_gradient)"
           )
         .style("stroke-linecap","round")
         .style("fill","none")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
                0.7
          )


        return group_enter


   make_ends: (group_enter) ->
      calc = new Calc_paths()
      grafts_group = group_enter.append("path")
         .attr("id", (d) -> d.div_id+"_"+"end")
         #.attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "grafted")
         .attr("d",  (d) ->
             if d.end_path?
               d.end_path
          )
         .attr("stroke-width", (d) ->   d.size *1)
         .style("stroke", (d) ->
             return "none"
             #return "url(#vein_gradient)"
          )
         .style("fill","none")
         .style("stroke-linecap","round")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
             #if d.graft_distal_anastomosis_segment_no != "0"
                0.0
              #else
              #  0.0
               )

      return group_enter


   make_t_grafts: (group_enter) ->
      calc = new Calc_paths()
      lesion = new Lesion()

      translate_interpolator = d3.interpolateString(start_translate, end_translate);

      grafts_group = group_enter.append("path")
         .attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "grafted")
         .attr("d",  (d) ->
                start_div = d.segment + "_" + "start"
                end_div =  d.segment + "_" +"end" +  "_" +"end"
                graft = d.segment
                path = calc.t_graft_path(graft, start_div, end_div)
                path

         )
         .attr("stroke-width", (d) ->
                    return d.size *0.7
              )
         .style("stroke", (d) ->
             if d.graft_type != 'vein'
               return "url(#arterial_gradient)"
             else
                return "url(#vein_gradient)"
          )
         .style("fill","none")
         .style("stroke-linecap","round")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
                0.9
               )

      percent_scale = d3.scale.linear()
            .domain([0,100])
            .range([0, _const.stenosis_size]);


      #percent_scale = d3.scale.linear()
      #      .domain([d3.min(graft_nodes, (d) -> return d['percent_stenosis']; ),
      #        d3.max(graft_nodes, (d) -> return d['percent_stenosis']; )])
      #      .range([0,stenosis_height]);

      lesions_group = group_enter.append('g')
           .attr('transform', (d) ->
                      if d.percent_stenosis isnt ""
                        return "translate("+ (d.points.x - (d.size * 3)) + ","+ d.points.y + ")"
           )



      make_graft_lesions = lesions_group.append("path")
         .attr("id", (d) -> d.div_id+"rain_drop")
         .attr("class",  (d) -> "rain_drop")
         .attr("d",  (d) ->
             if d.percent_stenosis isnt ""
                size = percent_scale(d.percent_stenosis)
                lesion.show_rain_drop(size)
          )
         .style("fill","url(#lesion_gradient)")
         .style("stroke","none")
         .attr("opacity", (d) ->
                  if d.percent_stenosis isnt ""
                       return 0.9
                  else
                    return 0.0 )

         .attr('transform', (d) ->
                      if d.percent_stenosis isnt ""
                        return "rotate(90)")
      ###
      lesions_group.append("text")
            .attr("id", "curve-text")
            .append("textPath")
            .attr("class", "textpath")
            .attr("xlink:href",(d) -> "#"+d.div_id+"rain_drop")
            .style("font-family", "sans-serif")
            .style("font-size", "0.85em")
            .style("font-weight","normal")
            .style("opacity","0.9")
            .style("stroke","none")
            .style("fill","cyan")
            .text((d) ->
                  if d.percent_stenosis isnt ""
                     d.percent_stenosis + "(%)"
             )


      lesions_group.append("use")
          .attr("id", "curve-line")
          .attr("xlink:href", (d) -> "#"+d.div_id+"rain_drop");

      ###
      graft_lesions_text_group = group_enter.append("text")
            .attr("x", (d) ->
                    if d.points.x isnt ""
                        d.points.x  + d.size*1.1)
            .attr("y", (d) ->
                   if d.points.y isnt ""
                        d.points.y - (d.size)
                )
            .attr("fill", "orange")
            .attr("text-align", "center")
            .attr("text-anchor","start")
            #.attr("text-anchor", (d) ->
            #    console.log("d.points.x: "+d.points.x)
            #    if (d.points.x < 180)
            #        return  "start"
            #    else
            #        return "end"; )
            #.attr("transform", (d) ->
            #    if(d.points.x < 180 )
            #        return "translate(8)"
            #    else
            #        return "rotate(180)translate(-8)" )
            .style("font-family", "sans-serif")
            .style("font-size", "0.65em")
            .style("font-weight","normal")
            .style("opacity","0.9")
            .style("stroke","none")
            .text((d) ->
                 if d.percent_stenosis isnt ""
                     d.percent_stenosis + " (%) "
             )


      graft_lesions_title = lesions_group.append('title')
      graft_lesions_title.append('text')
                   .text((d) -> "Stenosis "+ d.percent_stenosis +  " "+  "(%)" + " In The " + d.official_name + " "+"Part")


      over = grafts_group.on('click', (d) ->
          d3.select(this)
              .transition()
              .duration(5500)
              .ease("elastic")
              .attr("stroke-width", (d) ->   d.size*1.0 )
              .style("stroke", "white")
              .styleTween("transform", (d) -> return translate_interpolator)
              .each("end", (d) ->
                    d3.select(this)
                      .transition()
                      .delay(1000)
                      .duration(2500)
                      .attr("stroke-width", (d) ->   d.size*0.7 )
                      .style("stroke", (d) ->
                          if d.graft_type != 'vein'
                            return "url(#arterial_gradient)"
                          else
                            return "url(#vein_gradient)"  )  )
                      .attr("transform", (d) -> "translate("+ -40 + "," + -50 +")")

        )
      out = grafts_group.on('mouseout', (d) ->
        d3.select(this)
           #d3.select("#graft"+d.graft_proximal_anastomosis)
           #.transition()
           #.duration(500)
           #.attr("stroke-width", (d) ->  d.size*0.7  )
           .attr("cursor","move"))


      return grafts_group


class Draw_collaterals
   constructor: (data_in, group) ->
     @data = data_in
     @group = group

   calc = new Calc_paths()

   show_indicator:  (d) ->
        seg_path =  d3.select("path#col_from_segment_no"+d.col_from_segment_no).node()

        n0 = seg_path.getTotalLength()
        p1 = seg_path.getPointAtLength(n0*0.95)
        p2 = seg_path.getPointAtLength(n0*1.0)

        selector = d3.select("#collateral_group_enter")
        selector.append('circle')
          .attr("cx",p1.x)
          .attr("cy", p1.y)
          .attr("r", d.size*4)
          .style("stroke-width", d.size*1.1)
          .style("stroke","#fdae6b")
          .style("fill", (d) ->
                   return "#fee6ce"
            )
          .style("opacity",0.4)


   make_origins: () ->
        property =  new  Segment_property()

        vessel_group = @group.append('g')
            .selectAll('g')
            .attr('id',"collateral_group")
            .data(@data)


        group_enter = vessel_group
                    .enter()
                    .append('g')
                    .attr('id','collateral_group_enter')

        paths = group_enter.append("path")
        .attr("id", (d) -> "col_from_segment_no"+d.col_from_segment_no)
        .attr("class",  (d) -> "collateral_from_segment_no"+d.col_from_segment_no)
         .attr("d",  (d) ->
            d.from_path
          )
        return group_enter


   make_ends: (group) ->
      calc = new Calc_paths()
      ends_group = group.append("path")
         .attr("id", (d) -> "col_to_segment_no"+d.col_to_segment_no)
         .attr("class",  (d) -> "grafted")
         .attr("d",  (d) ->
               d.to_path
          )
         .attr("stroke-width", (d) ->   d.size)
         .style("stroke", (d) ->
             return "yellow"
             #return "url(#vein_gradient)"
          )
         .style("fill","none")
         .style("stroke-linecap","round")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
             #if d.graft_distal_anastomosis_segment_no != "0"
                0.9
              #else
              #  0.0
               )

      return group



   make_collaterals: ( group) ->
    translate_interpolator = d3.interpolateString(_const.col_start_translate, _const.col_end_translate);

    to_paths = group.append("path")
         .attr("id", (d) ->  d.col_to_segment_no)
         .attr("class", (d) -> "to")
         .attr("d",  (d) ->
               Draw_collaterals::show_indicator(d)
               start_div ="col_from_segment_no"+d.col_from_segment_no
               end_div = "col_to_segment_no"+d.col_to_segment_no
               path = calc.collateral_path(start_div, end_div)
               path
           )
         .attr("stroke","#fee6ce")
         .attr("stroke-width", (d) ->

                  d.size
                )
         .attr("opacity", 0.5)

    to_paths_title = group.append('title')
    to_paths_title_text = to_paths_title.append('text')
            .text((d) -> "Collateral." + " "+ "From: "+d.from_official_name+" "+"To: "+ d.to_official_name)

    over =  to_paths.on("mouseover", (d) ->
          d3.select(this)
            .style("cursor", "pointer"))




    on_click = to_paths.on('click', (d) ->
          d3.select(this)
              .style("cursor","pointer")
              .transition()
              .duration(5500)
              .ease("elastic")
              .attr("stroke-width", (d) ->   d.size*1.0 )
              .style("stroke", "white")
              .styleTween("transform", (d) -> return translate_interpolator) )

    return to_paths



class Draw_natives
   #utility = new Utility()
   calc = new Calc_paths()
   lesion = new Lesion()

   make: (patient_data , group) ->

       property =  new  Segment_property()
       vessel_group = group.append('g')
            .selectAll('g')
            .attr('id',"vessel_group")
            .data(patient_data)


       group_enter = vessel_group
                    .enter()
                    .append('g')
                    .attr('id','native_group_enter')


       paths = group_enter.append("path")
         .attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "native")
         .attr("d",  (d) ->
            if d.path isnt ""
               d.path
          )
         .attr("stroke-width", (d) ->
           return d.size
          )
         .style("fill","none")
         .style("stroke-linecap","round")
         .style("stroke","url(#vessel_gradient)")
         .style("stroke-join","round")
         .attr("opacity", (d) ->
              return  0.9)


       stent_paths = group_enter.append("path")
         .attr("id", (d) -> d.div_id)
         .attr("class", (d) -> "stent")
         .attr("d",  (d) ->
            calc.collateral_origin_path(d.segment, d.segment + "_" + "start")
            if d.stents_present isnt "0"
                div = d.segment + "_" + "start"
                stent_path = calc.construct_element(d.segment, div, 0.30, 0.50, "stent")
                ##please don't move it out from this function...
                #lesion = new Lesion()
                p_text =  lesion.show_text(group_enter, d.stent_points, "url(#stent_gradient)")
                p_text.text("Stent")
                stent_path
         )
         .attr("stroke-width", (d) ->
                  d.size *2
                )
         .attr("opacity", (d) ->
             if d.stents_present isnt "0"
               return 0.9
             else
               return 0.0
         )

       ###
       lesion = group_enter.append("path")
         .attr("id", (d) -> d.div_id)
         .attr("class",  (d) -> "lesion")
         .attr("d",  (d) ->
              if d.percent_stenosis > 0
                div = d.segment + "_" + "start"
                path = calc.construct_element(d.segment, div, 0.10, 0.30, "lesion")
                p_text =  lesion.show_text(group_enter, d.lesion_points, "orange")
                p_text.text( (d) ->
                    if d.percent_stenosis > 0
                       d.percent_stenosis + "(%)"
                )

                path
         )
         #.attr("stroke-width", (d) ->
         #  if d.percent_stenosis isnt "0"
         #         d.size - ( (d.size*d.percent_stenosis)/100)
         #  else
         #    d.size
         #   )
         .attr("stroke-width", (d) -> d.size * 2   )
         .style("fill","none")
         .attr("opacity", (d) ->
           if d.percent_stenosis > 0
              return 0.9
           else
             return 0.0
           )
       ###

       #percent_scale = d3.scale.linear()
       #     .domain([d3.min(native_nodes, (d) -> return d['percent_stenosis']; ),
       #       d3.max(native_nodes, (d) -> return d['percent_stenosis']; )])
       #     .range([0,stenosis_height]);

       percent_scale = d3.scale.linear()
            .domain([0,100])
            .range([0, _const.stenosis_size]);



       lesions_group = group_enter.append('g')
           .attr('transform', (d) ->
                      div = d.segment + "_" + "start"
                      calc.construct_element(d.segment, div, 0.10, 0.30, "lesion")
                      if d.percent_stenosis >  0
                        size = percent_scale(d.percent_stenosis)
                        return "translate("+ ( d.lesion_points.x - d.size*4.8 ) + ","+  d.lesion_points.y + ")"
           )

       make_natives_lesions = lesions_group.append("path")
         .attr("id", (d) -> d.div_id+"rain_drop")
         .attr("class",  (d) -> "rain_drop")
         .attr("d",  (d) ->
             if d.percent_stenosis > 0
                size = percent_scale(d.percent_stenosis)
                #size2 = radius_scale(d.percent_stenosis)
                lesion = new Lesion()
                lesion.show_rain_drop(size)

          )
         .style("fill","url(#lesion_gradient)")
         .style("stroke","none")
         .attr("opacity", (d) ->
                  if d.percent_stenosis > 0
                       return 0.9
                  else
                    return 0.0 )

         .attr('transform', (d) ->
                      if d.percent_stenosis isnt ""
                        return "rotate(90)")

       native_lesions_text_group = group_enter.append("text")
            .attr("x", (d) ->
                    div = d.segment + "_" + "start"
                    calc.construct_element(d.segment, div, 0.10, 0.30, "lesion")
                    if d.lesion_points.x isnt ""
                        d.lesion_points.x + d.size*2.5)
            .attr("y", (d) ->
                   if d.lesion_points.y isnt ""
                        d.lesion_points.y
                )
            .attr("fill", "orange")
            .attr("text-align", "center")
            .attr("text-anchor","start")
            #.attr("text-anchor", (d) ->
            #    console.log("d.points.x: "+d.points.x)
            #    if (d.points.x < 180)
            #        return  "start"
            #    else
            #        return "end"; )
            #.attr("transform", (d) ->
            #    if(d.points.x < 180 )
            #        return "translate(8)"
            #    else
            #        return "rotate(180)translate(-8)" )
            .style("font-family", "sans-serif")
            .style("font-size", "0.65em")
            .style("font-weight","normal")
            .style("opacity","0.9")
            .style("stroke","none")
           .text((d) ->
                  if d.percent_stenosis > 0
                     d.percent_stenosis + " (%) "
             )





       over = group_enter.on('mouseover', (d) ->
          div = d.segment + "_" + "start"
          d3.select("#"+div)
         #d3.select("#"+d.segment_no)
              .transition()
              .duration(1500)
              .attr("stroke-width", (d) -> (d.size - ( (d.size*d.percent_stenosis)/100)) * 3)
              .attr("cursor","pointer") )


       out = group_enter.on('mouseout', (d) ->
          div = d.segment + "_" + "start"
          d3.select("#"+div)
          #d3.select("#"+d.segment_no)
            .transition()
            .duration(500)
            .attr("stroke-width", (d) ->  d.size - ( (d.size*d.percent_stenosis)/100) )
            .attr("cursor","move"))


       return  group_enter





class Vessels
    constructor: (data) ->
      @data = data

    guides = new Guides()
    property =  new  Segment_property()


    draw: (vis) ->
      bullets_group = guides.make_bullets(vis)
      bullets_color = property.color(bullets_group)

      ######## NATIVE VESSELS #####################
      draw_natives = new Draw_natives()
      natives_enter_group = draw_natives.make(@data['natives'], bullets_group)
      natives_color = property.color(natives_enter_group)
      natives_title = property.title(natives_enter_group)
      natives_title_text = natives_title.text((d) ->
                               " " + d.official_name )

      if @data['grafts'].length > 0
         @draw_grafts(bullets_group)

      if @data['collaterals'].length  > 0
         @draw_collaterals(bullets_group)




    draw_grafts: (bullets_group) ->
    ###### GRAFTS ######################

      draw_grafts = new Draw_grafts(@data['grafts'], bullets_group)
      grafts_enter_group = draw_grafts.make_origins()
      grafts_ends_group = draw_grafts.make_ends(grafts_enter_group)
      grafts_vessel_group = draw_grafts.make_grafts(grafts_enter_group)
      grafts_color = property.color(grafts_enter_group)
      grafts_title = property.title(grafts_enter_group)
      grafts_title_text = grafts_title.text((d) -> "Graft From: " + " " + d.proximal_site + ", "+ "Graft Type: "+ d.graft_type  )

      #### T GRAFTS ###############
      draw_t_grafts = new Draw_t_grafts(@data['t_grafts'], bullets_group)
      t_grafts_enter_group = draw_t_grafts.make_origins()
      t_grafts_ends_group = draw_t_grafts.make_ends(t_grafts_enter_group)
      t_grafts_vessel_group = draw_t_grafts.make_t_grafts(t_grafts_enter_group)
      t_grafts_title = property.title(t_grafts_enter_group)
      t_grafts_title_text = t_grafts_title.text((d) ->
                         "T Graft From: " + " " + d.proximal_site + ", "+ "Type: "+ d.graft_type  )


    draw_collaterals: (bullets_group) ->
      col = new Draw_collaterals(@data['collaterals'], bullets_group)
      col_enter_group = col.make_origins()
      col.make_ends(col_enter_group)
      col.make_collaterals(col_enter_group)
      #console.log("jgour.all_tree_links: "+ JSON.stringify(all_tree_links))
class View_tree
    constructor: (data) ->
        @data = data
        @init()

    init: () ->
        setup = new Setup()
        vis   = setup.vis()
        vessels = new Vessels(@data)
        vessels.draw(vis)



# "Classic" linked list implementation that doesn't keep track of its size.
#http://github.com/nzakas/computer-science-in-javascript
#https://github.com/jashkenas/coffeescript/blob/master/examples/computer_science/linked_list.coffee
#list = new LinkedList
#list.add("zero").add("one").add("two")
#console.log list.size()     is 3
#console.log list.item(2)    is "two"
#console.log list.remove(1)  is "one"
#console.log list.item(0)    is "zero"
#console.log list.item(1)    is "two"
#console.log list.size()     is 2
#console.log list.item(-10)  is null
class Linked_list

  constructor: ->
    @_head = null # Pointer to the first item in the list.


  # Appends some data to the end of the list. This method traverses the existing
  # list and places the value at the end in a new node.
  add: (data) ->

    # Create a new node object to wrap the data.
    node = data: data, next: null

    current = @_head or= node

    if @_head isnt node
      current = current.next while current.next
      current.next = node

    this


  # Retrieves the data at the given position in the list.
  item: (index) ->

    # Check for out-of-bounds values.
    return null if index < 0

    current = @_head or null
    i = -1

    # Advance through the list.
    current = current.next while current and index > ++i

    # Return null if we've reached the end.
    current and current.data


  # Remove the item from the given location in the list.
  remove: (index) ->

    # Check for out-of-bounds values.
    return null if index < 0

    current = @_head or null
    i = -1

    # Special case: removing the first item.
    if index is 0
      @_head = current.next
    else

      # Find the right location.
      [previous, current] = [current, current.next] while index > ++i

      # Skip over the item to remove.
      previous.next = current.next

    # Return the value.
    current and current.data


  # Calculate the number of items in the list.
  size: ->
    current = @_head
    count = 0

    while current
      count += 1
      current = current.next

    count


  # Convert the list into an array.
  toArray: ->
    result  = []
    current = @_head

    while current
      result.push current.data
      current = current.next

    result


  # The string representation of the linked list.
  toString: -> @toArray().toString()

class Collaterals_file

  make: (db_data) ->
    for db in db_data
      for n in natives_template
         if db.col_from_segment_no is n.segment_no
           @from = n.segment_no
           @from_official = n.name

         else if db.col_to_segment_no is n.segment_no
           @to = n.segment_no
           @to_official = n.name
        collateral_nodes.push({"segment_index":nodes_count,
        "col_from_segment_no":@from,
        "from_path":"",
        "col_via_segment_no":db.col_via_segment_no,
        "via_path":"",
        "col_to_segment_no":@to,
        "to_path":"",
        "from_official_name":@from_official,
        "to_official_name":@to_official,
        "size":"1.2"})
        nodes_count++
        all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":"")

    return  collateral_nodes



class Graft_t_segments_file

  make: (db_data) ->
      for db in db_data
        for a_graft  in t_grafts_template
          if db.graft_proximal_anastomosis is a_graft.graft_proximal_anastomosis
            for a in [1..7]
              switch a
                when 1 then t_graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "start",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Proximal Anastomosis",
                "start_path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":""
                })


                when 2 then t_graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "ostial",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Ostial",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size - 0.2,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_ostial_percent
                })

                when 3 then t_graft_nodes.push({"segment_index":nodes_count,
                #"name":n.segment_no + "_" + a, "div_id":i + "_" +n.segment_no+"_"+a,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "proximal",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Proximal",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size - 0.4,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_proximal_percent
                })

                when 4 then t_graft_nodes.push({"segment_index":nodes_count,
                #"name":n.segment_no + "_" + a, "div_id":i + "_" +n.segment_no+"_"+a,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "mid",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Mid",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size - 0.6,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_mid_percent
                })

                when 5 then t_graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "distal",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Distal",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size - 0.8,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_distal_percent                })


                when 6 then t_graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "distal_anastomosis",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Distal Anastomosis",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size - 0.8,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_distal_anastomosis_percent
                })

                #links.push("source":nodes_count, "target":nodes_count+1,"path":"")

                when 7 then t_graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "end",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Distal End Of The Graft",
                "end_path":@distal_anastomosis_path(db.graft_distal_anastomosis_segment_no),
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "starting_graft":a_graft.graft,
                "size":a_graft.size - 1,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":""
                })

                #when 8 then t_graft_nodes.push({"segment_index":nodes_count,
                #"segment":a_graft.graft_proximal_anastomosis,
                #"div_id":a_graft.graft_proximal_anastomosis + "_" + "t_graft",
                #"name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                #"t_graft_path":"",
                #"points":"",
                #"size":a_graft.size - 1,
                #"graft_type":db.graft_type,
                #"stents_present":"0",
                #"percent_stenosis":""

                #})
              linked_nodes.add(nodes_count)
              all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":"")

              nodes_count++


      return t_graft_nodes

  distal_anastomosis_path:  (segment_no) ->
        for p in  natives_template
          if p.segment_no is  segment_no
            return p.path




class Graft_segments_file
  make: (db_data) ->
      for db in db_data

        for a_graft  in grafts_template
          #for db in db_data
          if db.graft_proximal_anastomosis is a_graft.graft_proximal_anastomosis

            for a in [1..7]
              switch a
                when 1 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "start",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Proximal Anastomosis",
                "start_path":a_graft.proximal_anastomosis_path,
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":""
                })
                #all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":"")

                when 2 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "ostial",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Ostium",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size - 0.2,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_ostial_percent
                })
                #links.push("source":nodes_count, "target":nodes_count+1,"path":"")

                when 3 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "proximal",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Proximal",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size - 0.4,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_proximal_percent
                })
                #links.push("source":nodes_count, "target":nodes_count+1,"path":"")

                when 4 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "mid",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Middle",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size - 0.6,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_mid_percent
                })

                when 5 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "distal",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Distal",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size - 0.8,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_distal_percent
                })
                #all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":"")

                when 6 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "distal_anastomosis",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Distal Anastomosis",
                "path":"",
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size - 0.8,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":db.loc_graft_stenosis_distal_anastomosis_percent
                })
                #links.push("source":nodes_count, "target":nodes_count+1,"path":"")

                when 7 then graft_nodes.push({"segment_index":nodes_count,
                "segment":a_graft.graft_proximal_anastomosis,
                "div_id":a_graft.graft_proximal_anastomosis + "_" + "end",
                "name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                "official_name":"Distal End Of The Graft",
                "end_path":@distal_anastomosis_path(db.graft_distal_anastomosis_segment_no),
                "points":"",
                "proximal_site":a_graft.proximal_site,
                "size":a_graft.size - 1,
                "graft_type":db.graft_type,
                "stents_present":"0",
                "percent_stenosis":""

                })
                #when 8 then graft_nodes.push({"segment_index":nodes_count,
                #"segment":a_graft.graft_proximal_anastomosis,
                #"div_id":a_graft.graft_proximal_anastomosis + "_" + "t_graft",
                #"name":a_graft.graft_proximal_anastomosis + "_" + nodes_count + "_" + a,
                #"t_graft_path":"",
                #"points":"",
                #"size":a_graft.size - 1,
                #"graft_type":db.graft_type,
                #"stents_present":"0",
                #"percent_stenosis":""
                #})

              all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":"")

              linked_nodes.add(nodes_count)

              nodes_count++

      return graft_nodes

   ####CHECK IF THE DISTAL ANASTOMOSIS IS THE SAME WITH THE INCOMING DATA AND
   #ASIGN THE  PATH OF THE VESSEL ACCORDING THE PREDEFINED VALUES IN THE TEMPLATES
  distal_anastomosis_path:  (segment_no) ->
        for p in  natives_template
          if p.segment_no is  segment_no
            return p.path


#######end class Prepare_templates########
class Native_segments_file

  make: (db_data) ->
    #segments = new Array()
    links2 = new Array()

    for n  in natives_template
        ## set the default values
        @stents_present = "0"
        @stenosis  = "0"
        for db in db_data
          #for db in db_data['natives']
          if db.segment_no is n.segment_no
             @stenosis = db.percent_stenosis
             @stents_present = db.stents_present

        for a in [1..6]

          switch a
            when 1 then native_nodes.push({"segment_index":nodes_count,
            "segment":n.segment_no,
            "div_id":n.segment_no + "_" + "start",
            "name":n.segment_no + "_" + nodes_count + "_" + a,
            "path":n.path,
            "lesion_points":"",
            "stent_points":"",
            "size":n.size,
            "official_name":n.name,
            "vessel":n.vessel,
            "stents_present":"0",
            "percent_stenosis":0
            })

            when 2 then  native_nodes.push({"segment_index":nodes_count,
            "segment":n.segment_no,
            "div_id":n.segment_no + "_" + "lesion",
            "name":n.segment_no + "_" + nodes_count + "_" + a,
            "path":"",
            "lesion_points":"",
            "stent_points":"",
            "size":n.size,
            "official_name":n.name,
            "vessel":n.vessel,
            "stents_present":"0",
            "percent_stenosis":@stenosis})

            when 3 then  native_nodes.push({"segment_index":nodes_count,
            "segment":n.segment_no,
            "div_id":n.segment_no + "_" + "stent",
            "name":n.segment_no + "_" + nodes_count + "_" + a,
            "path":"",
            "lesion_points":"",
            "stent_points":"",
            "size":n.size - 0.4,
            "official_name":n.name,
            "vessel":n.vessel,
            "stents_present":@stents_present,
            "percent_stenosis":0})

            when 4 then   native_nodes.push({"segment_index":nodes_count,
            #"name":n.segment_no + "_" + a, "div_id":i + "_" +n.segment_no+"_"+a,
            "segment":n.segment_no,
            "div_id":n.segment_no + "_" +  "graft",
            "name":n.segment_no + "_" + nodes_count + "_" + a,
            "path":"",
            "lesion_points":"",
            "stent_points":"",
            "size":n.size - 0.6,
            "official_name":n.name,
            "vessel":n.vessel,
            "stents_present":"0",
            "percent_stenosis":0
            })

            when 5 then   native_nodes.push({"segment_index":nodes_count,
            #"name":n.segment_no + "_" + a, "div_id":i + "_" +n.segment_no+"_"+a,
            "segment":n.segment_no,
            "div_id":n.segment_no + "_" + "collateral",
            "name":n.segment_no + "_" + nodes_count + "_" + a,
            "path":"",
            "lesion_points":"",
            "stent_points":"",
            "size":n.size - 0.8,
            "official_name":n.name,
            "vessel":n.vessel,
            "stents_present":"0",
            "percent_stenosis":0})
            #all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":"")

            when 6 then   native_nodes.push({"segment_index":nodes_count,
            "segment":n.segment_no,
            "div_id":n.segment_no + "_" + "end",
            "name":n.segment_no + "_" + nodes_count + "_" + a,
            "path":"",
            "lesion_points":"",
            "stent_points":"",
            "size":n.size - 1,
            "official_name":n.name,
            "vessel":n.vessel,
            "stents_present":"0",
            "percent_stenosis":0})


          all_tree_links.push("source":nodes_count, "target":nodes_count+1,"path":n.path,"segment_no":n.segment_no)
          linked_nodes.add(nodes_count)

          nodes_count++

     return native_nodes




class Prepare_templates
  constructor: (info_id, cath_procedure_id) ->
      @info_id = info_id
      @cath_procedure_id = cath_procedure_id

  init:  ->
    @get_stored_data()


  get_stored_data: () ->
      $.ajax({
          type:"GET",
          url:'/cath_procedures/' +@cath_procedure_id + '/cor_angio_infos/'+ @info_id,
          dataType: 'json',
          success: ( db_data) ->
             proccess_data( db_data)
          })


  proccess_data = (db_data) ->
      console.log("db_data from proccess_data: "+ JSON.stringify(db_data['cor_angio_info']))
      #console.log("db_data from proccess_data: "+ JSON.stringify(db_data['cor_angio_info']['grafts']))
      #console.log("db_data from proccess_data: "+ JSON.stringify(db_data['cor_angio_info']['collaterals']))

      #collect_nodes = make_nodes(db_data)
      #cor_info_tmp = make_cor_info(db_data['cor_angio_info']['collaterals'])

      ##### MAKE THE NATIVE VESSELS TEMPLATE
      #natives_tmp = make_natives_file(db_data)
      n_segments =  new Native_segments_file()

      natives_tmp = n_segments.make(db_data['cor_angio_info']['natives'])
      all_tree_nodes={"natives":natives_tmp}

      ####MAKE THE GRAFTS IF ANY
      grafts = db_data['cor_angio_info']['grafts']
      g_segments = new Graft_segments_file()
      grafts_tmp = g_segments.make(grafts)

      all_tree_nodes = []
      all_tree_nodes= {"natives":natives_tmp, "grafts":grafts_tmp}


      t_segments = new Graft_t_segments_file()
      t_grafts_tmp = t_segments.make(grafts)
      all_tree_nodes = []
      all_tree_nodes= {"natives":natives_tmp, "grafts":grafts_tmp, "t_grafts":t_grafts_tmp}


      #### MAKE TH COLLATERALS
      col = new Collaterals_file()
      collaterals_tmp = col.make(db_data['cor_angio_info']['collaterals'])
      all_tree_nodes = []
      all_tree_nodes= {"natives":natives_tmp, "grafts":grafts_tmp, "t_grafts":t_grafts_tmp, "collaterals":collaterals_tmp}


      #### CONSTRUCT THE FINAL ARRAY OF DATA
      #final_template = {"natives":natives_tmp, "grafts":grafts_tmp, "t_grafts":t_grafts_tmp, "collaterals":collaterals_tmp}
      final_template = {"natives":natives_tmp, "grafts":grafts_tmp, "t_grafts":t_grafts_tmp, "collaterals":collaterals_tmp}


      view_tree = new View_tree(final_template)







linked_nodes = new Linked_list()


############################


this.save_svg = () ->
  html = d3.select("svg")
    .attr("title", "cor_tree")
    .attr("version", 1.1)
    .attr("xmlns", "http://www.w3.org/2000/svg")
    .node().parentNode.innerHTML;

  d3.select("#cor_tree_id").append("div")
        .attr("id", "download")
        .style("top", event.clientY+20+"px")
        .style("left", event.clientX+"px")
        .html("Right-click on this preview and choose Save as<br />Left-Click to dismiss<br />")
        .append("img")
        .attr("src", "data:image/svg+xml;base64,"+ btoa(html))

  d3.select("#download")
        .on("click", () ->
            if(event.button is 0)
                d3.select(this).transition()
                    .style("opacity", 0)
                    .remove();
          )
       .transition()
       .duration(500)
       .style("opacity", 1);

global_vars = {"cor_angio_info_id":""}

this.zero_params = () ->
  global_vars.cor_angio_info_id = ""
  collateral_nodes = []
  native_nodes = []
  graft_nodes = []
  t_graft_nodes = []
  all_tree_nodes = []
  all_tree_links = []

this.hide_cor_tree = (cor_angio_info_id) ->
  @zero_params()
  d3.select("#cor_tree_content"+cor_angio_info_id).remove()


this.view_cor_tree = (cor_angio_info_id, cath_procedure_id) ->
  @zero_params()
  cor_tree_selector = $("#cor_tree_id")
  id = 'cor_tree_content'+cor_angio_info_id

  global_vars.cor_angio_info_id =  cor_angio_info_id

  cor_tree_selector.append("<div id="+ id + "> </div>")
  prepare = new Prepare_templates(cor_angio_info_id, cath_procedure_id)
  prepare.init()


