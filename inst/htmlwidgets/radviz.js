var dbg, dbg_dat;

HTMLWidgets.widget({

  name: 'radviz',
  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {
        
        /* fix multiple tooltip problem
            for standalone we will need to explicitly
            assign position : relative for our
            htmlwidget container div
            since radviz tooltip needs absolute positioning
            
          I tested in tagList, rmarkdown, and shiny
        */
        el.style.position = "relative";


        var data = HTMLWidgets.dataframeToD3(x.data);

        var rvConfig = {};

        rvConfig.el = el;
        rvConfig.dimensions = x.dimensions;
        rvConfig.drawLinks = x.drawLinks;
        rvConfig.zoomFactor = x.zoomFactor;
        rvConfig.dotRadius = x.dotRadius;
        rvConfig.useRepulsion = x.useRepulsion;
        rvConfig.size = x.diameter;
        rvConfig.margin = x.margin;
        rvConfig.useTooltip = x.useTooltip;
        rvConfig.colorAccessor = function(d) { return(d[x.colorAccessor]); };

        if (x.usePalette) {
          rvConfig.colorScale = d3.scale.ordinal().range(x.palette);
        }

        if (x.useTooltip) {
          rvConfig.tooltipFormatter = x.tooltipFormatter;
        }

        var radviz = radvizComponent()
                       .config(rvConfig)
                       .on('panelEnter', function() {
                           // mouse entered the circular panel
                       })
                       .on('panelLeave', function() {
                           // mouse left the circular panel
                       })
                       .on('dotEnter', function() {
                           // mouse entered a dot
                       })
                       .on('dotLeave', function() {
                           // mouse left a dot
                       });

        radviz.render(data);

      },

      resize: function(width, height) {  }

    };

  }

});
