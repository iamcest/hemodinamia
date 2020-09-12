export class  Gradients{
    constructor(){}

    blue(group, id){
        this.group = group;
        let  gradient = this.group.append("defs").append("linearGradient")
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
            .attr("stop-color", "#19162B");

        return gradient;
    }

    linear2(group, id, color_1,color_2){
        let gradient_linear = group.append("svg:defs")
            .append("svg:linearGradient")
            .attr("id", id)
            .attr("x","0%")
            .attr("y","0%")
            .attr("x2","100%")
            .attr("y2","100%");

        gradient_linear.append("svg:stop")
            .attr("offset", "30%")
            .attr("stop-color", color_1)
            .attr("stop-opacity", 0.7);

        gradient_linear.append("svg:stop")
            .attr("offset", "30%")
            .attr("stop-color", color_2)
            .attr("stop-opacity", 0.7);

        gradient_linear.append("svg:stop")
            .attr("offset", "70%")
            .attr("stop-color", color_2)
            .attr("stop-opacity", 0.7);


        gradient_linear.append("svg:stop")
            .attr("offset", "70%")
            .attr("stop-color", color_1)
            .attr("stop-opacity",0.7);
            //.attr("gradientTransform", "rotate(5)");
        /*
          <svg xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 61 57" 
    version="1.1" x="0px" y="0px">
    <defs>
      <linearGradient id="horizontalPipe" x2="0" y2="1">
        <stop offset="0" stop-color="white"/>
        <stop offset="0.25" stop-color="black"/>
        <stop offset="0.75" stop-color="black"/>
        <stop offset="1" stop-color="white"/>
      </linearGradient>
      <linearGradient id="verticalPipe">
        <stop offset="0" stop-color="white"/>
        <stop offset="0.25" stop-color="black"/>
        <stop offset="0.75" stop-color="black"/>
        <stop offset="1" stop-color="white"/>
      </linearGradient>
      <radialGradient id="curvedPipe" cx="0" cy="0" r="1">
        <stop offset="0.57" stop-color="white"/>
        <stop offset="0.677" stop-color="black"/>
        <stop offset="0.893" stop-color="black"/>
        <stop offset="1" stop-color="white"/>
      </radialGradient>
    </defs>
    
    <rect x="8" y="40" width="19" height="12" fill="url(#horizontalPipe)"/>
    <path d="M 27,40 A 16,16, 0,0,0 43,24 H 55 A 28,28, 0,0,1, 27,52 Z" fill="url(#curvedPipe)"/>
    <rect x="43" y="8" width="12" height="16" fill="url(#verticalPipe)"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 150 150" >
    <defs>
        <filter id="filter1">
            <feGaussianBlur in="SourceAlpha" stdDeviation="4" result="blurOut" />
            <!-- We cut off the parts that overlap the source graphic… -->
            <feComposite operator="in" in="blurOut" in2="SourceAlpha" result="COMPOSITE"/>
            <!-- … and then merge source graphic and lighting effect: -->
            <feMerge>
                <feMergeNode in="SourceGraphic" />
                <feMergeNode in="COMPOSITE"/>
            </feMerge>
        </filter>

        <!-- https://www.smashingmagazine.com/2015/05/why-the-svg-filter-is-awesome/ -->
        <filter id="filter2">
            <!--We create a heightmap by blurring the source: -->
            <feGaussianBlur stdDeviation="5" in="SourceAlpha" result="BLUR"/>
            <!-- We then define a lighting effect with a point light that is positioned at virtual 3D coordinates x: 40px, y: -30px, z: 200px: -->
            <feSpecularLighting surfaceScale="6" specularConstant="1" specularExponent="30" lighting-color="#white" in="BLUR" result="SPECULAR">
                <fePointLight x="40" y="40" z="2000" />
            </feSpecularLighting>
            <!-- We cut off the parts that overlap the source graphic… -->
            <feComposite operator="in" in="SPECULAR" in2="SourceAlpha" result="COMPOSITE"/>
            <!-- … and then merge source graphic and lighting effect: -->
            <feMerge>
                <feMergeNode in="SourceGraphic" />
                <feMergeNode in="COMPOSITE"/>
            </feMerge>
        </filter>
    </defs>

    <path stroke="white" stroke-width="20" fill="none" filter="url(#filter1)" 
          d="M-90,50 h150 a20,20 0 0,0 20,-20 v-150" />

    <path stroke="black" stroke-width="20" fill="none" filter="url(#filter2)" 
          d="M-40,100 h150 a20,20 0 0,0 20,-20 v-150" />
</svg>
 Run code snippetHide results
          */

    }
    linear(group, id, color_1,color_2) {

        let gradient_linear = group.append("svg:defs")
            .append("svg:linearGradient")
            .attr("id", id)
            .attr("x","0%")
            .attr("y","0%")
            .attr("x2","100%")
            .attr("y2","100%");

        gradient_linear.append("svg:stop")
            .attr("offset", "0%")
            .attr("stop-color", color_1)
            .attr("stop-opacity", 1);


        gradient_linear.append("svg:stop")
            .attr("offset", "100%")
            .attr("stop-color", color_2)
            .attr("stop-opacity",0.7)
            .attr("gradientTransform", "rotate(45)");
    };//linear gradient


    radial(group, id, color_1, color_2) {

        let gradient_radial = group.append("svg:defs")
            .append("svg:radialGradient")
            .attr("id", id)
            .attr("cx", "50%")
            .attr("cy", "50%")
            .attr("fx", "50%")
            .attr("fy", "80%")
            .attr("spreadMethod", "pad");

        gradient_radial.append("svg:stop")
            .attr("offset", "0%")
            .attr("stop-color", color_1)
            .attr("stop-opacity", 1);

        gradient_radial.append("svg:stop")
            .attr("offset", "100%")
            .attr("stop-color", color_2)
            .attr("stop-opacity",0.7);

        return gradient_radial;

    };//radialGradient

};//class
