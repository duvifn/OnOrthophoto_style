/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */
/*
// 10M
#contours [one_hundred != true][fifty != true][ele != 0]{
  [zoom>=17][zoom<=19]{
    text-name:[ele];
    text-face-name:@sans;
    text-placement:line;
    text-fill:#a2a2a2;
    text-halo-fill: @place_halo;
    text-halo-radius: 0.6;
    text-min-path-length: 200.0;
    text-spacing: 400.0;
    text-label-position-tolerance : 100;
    text-max-char-angle-delta: 10;
    text-size: 8;
  }
}
// 50M
#contours[fifty = true][ele != 0][zoom>=14][zoom<=17]{
  text-name:[ele] ;
  text-face-name:@sans;
  text-placement:line;
  [zoom=14] {text-fill: #aaa; } 
  [zoom > 14] {text-fill: #a2a2a2; }
  text-halo-fill: @place_halo;
  text-halo-radius: 0.6;
  text-min-path-length: 200.0;
  text-spacing: 400.0;
  text-label-position-tolerance : 100;
  text-max-char-angle-delta: 10;
  text-size: 8;
  [zoom >= 16] {text-size: 10; }
}

// 100M
#contours [one_hundred = true][fifty != true][ele != 0][zoom>=13][zoom<=17]{
  text-name:"[ele].replace('([0-9]+)\.(.+)','$1')";
  text-face-name:@sans;
  text-placement:line;
  text-fill:#a2a2a2;
  text-halo-fill: @place_halo;
  text-halo-radius: 0.6;
  [zoom >= 16] {text-size: 10; }
}

*/

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

#place::country[type='country'][zoom>3][zoom<9] {
  text-name: '[name]';
  text-face-name: @sans_bold;
  text-placement: point;
  [zoom=2] { text-face-name: @sans; }
  text-size: 10;
  text-fill: @place_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-halo-comp-op: minus;
  text-wrap-width: 30;
  text-margin: 2;
  [zoom=3] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=4] {
    text-size:11 + @text_adjust;
    text-wrap-width: 30;
  }
  [zoom>4] {
    text-size:18;
  }
  [zoom=5] {
    text-size:11 + @text_adjust;
    text-wrap-width: 30;
    text-line-spacing: 1;
  }
  [zoom=6] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 40;
    text-line-spacing: 2;
  }
  [zoom=7] {
    text-size:14 + @text_adjust;
    text-character-spacing: 1.2;
  }
}

#place::state[type='state'][zoom>=5][zoom<=10] {
  text-name:'[name]';
  text-face-name: @sans_lt;
  text-placement: point;
  text-fill: @place_text;
  text-size: 10;
  text-opacity: 0.9;
  text-halo-fill: @state_halo;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-halo-comp-op: minus;
  text-margin: 2;
  [zoom=6] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=7] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>8] {
    text-size:12;
    text-halo-radius: 0;
  }
  [zoom=8] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=9] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=10] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

/* ---- Cities ------------------------------------------------------ */

#place::city[type='city'][zoom>=8][zoom<=16] {
  
  /*::inner {
    [zoom>=10] {
      marker-type: ellipse;
      marker-fill: black;
      marker-width: 5;
      marker-height: 5;
      marker-placement: point;
      marker-line-width: 0;
      marker-line-opacity: 0.65;
      marker-allow-overlap: true;
    }
  }*/
  ::labels {
    text-name:'[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @place_text;
    text-halo-fill: @city_halo;
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
    text-halo-comp-op: minus;
    text-margin: 2;
    text-size: 11;
    marker-width: 4;
    marker-fill: @place_text;
    marker-line-width: 1;
    marker-line-color: rgba(0,0,0,0.5);
    [zoom<=8] {
      text-size: 9;
    }
    [zoom=9] {
      text-size:13;
      text-wrap-width: 60;
    }
    [zoom=10] {
      text-size:13;
      text-wrap-width: 70;
    }
    [zoom=11] {
      text-size:12;
      text-character-spacing: 1;
      text-wrap-width: 80;
    }
    [zoom=12] {
      text-size:13;
      text-character-spacing: 1;
      text-wrap-width: 100;
    }
    [zoom=13] {
      text-size:14;
      text-character-spacing: 2;
      text-wrap-width: 200;
      text-transform: uppercase;
    }
    [zoom=14] {
      text-size:15;
      text-character-spacing: 4;
      text-wrap-width: 300;
      text-transform: uppercase;
    }
    [zoom=15] {
      text-size:16;
      text-character-spacing: 6;
      text-wrap-width: 400;
      text-transform: uppercase;
    }
   }
}

/* ---- Towns ------------------------------------------------------- */

#place::town[type='town'][zoom>=12][zoom<=17] {
  text-name:'[name]';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @place_text;
  text-halo-fill: @town_halo;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-halo-comp-op: minus;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -4;
  text-margin: 5;
  text-avoid-edges:	true;
  text-size: 12;

  [zoom>=12]{
    text-size:12;
    text-line-spacing: 1;
  }
  [zoom>=13]{
    text-transform: uppercase;
    text-character-spacing: 1;
    text-line-spacing: 2;
  }
  [zoom>=14]{
    text-size:13;
    text-character-spacing: 2;
    text-line-spacing: 3;
  }
  [zoom>=15]{
    text-size:14;
    text-character-spacing: 3;
    text-line-spacing: 4;
  }
  [zoom>=15]{
    text-size:15;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  [zoom>=17]{
    text-size:16;
    text-character-spacing: 5;
    text-line-spacing: 6;
  }
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='village'][zoom>=13],
#place::small[type='suburb'][zoom>=13],
#place::small[type='hamlet'][zoom>=13],
#place::small[type='neighbourhood'][zoom>=13] {
  text-name:'[name]';
  text-face-name: @sans;
  text-placement: point;
  text-fill: @place_text;
  text-size: 11;
  text-halo-fill: @village_halo;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-halo-comp-op: minus;
  text-line-spacing: -4;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-margin: 5;
  [zoom>=14] {
    text-size:12;
    text-character-spacing: 1;
    text-wrap-width: 40;
    text-line-spacing: 1;
  }
  [zoom>=15] {
    text-transform: uppercase;
    text-character-spacing: 1;
    text-wrap-width: 60; 
    text-line-spacing: 1;
  }
  [zoom>=16] {
    text-size:12;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
  } 
  [zoom>=17] {
    text-size:13; 
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=18] {
    text-size:14;
    text-character-spacing: 4;
    text-line-spacing: 6;
  }
}

#place::small[type='locality'][zoom>=15] {
  text-name:'[name]';
  text-name: @name;
    text-face-name: @sans;
    text-transform:	uppercase;
    text-placement: point;
    text-fill: @place_text;
    text-size: 10;
    text-character-spacing:	2;
    text-halo-fill: @neigh_halo;
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
    text-line-spacing: -2;
    text-wrap-width: 80;
    text-wrap-before: true;
    text-margin: 2;
  [zoom>=16] {
    text-size:10;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size:11;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:12;
    text-character-spacing: 1;
    text-line-spacing: 4;
  }
}

#poi[type='university'][zoom>=15],
#poi[type='hospital'][zoom>=16],
#poi[type='school'][zoom>=17],
#poi[type='library'][zoom>=17] {
  text-name:"[name]";
  text-face-name:@sans;
  text-size:10;
  text-wrap-width:30;
  text-fill: @poi_text;
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom=18] {
    text-size: 14;
    text-spacing: 300;
  }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[zoom>=11][zoom<=14][reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #000;
  shield-file: url(img/shield-motorway-1.png);
  [type='motorway'] {
    [reflen=1] { shield-file: url(img/default-1.svg); }
    [reflen=2] { shield-file: url(img/default-2.svg); }
    [reflen=3] { shield-file: url(img/default-3.svg); }
    [reflen=4] { shield-file: url(img/default-4.svg); }
    [reflen=5] { shield-file: url(img/default-5.svg); }
    [reflen=6] { shield-file: url(img/default-6.svg); }
    [reflen=7] { shield-file: url(img/default-6.svg); }
    [reflen=8] { shield-file: url(img/default-6.svg); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(img/default-1.svg); }
    [reflen=2] { shield-file: url(img/default-2.svg); }
    [reflen=3] { shield-file: url(img/default-3.svg); }
    [reflen=4] { shield-file: url(img/default-4.svg); }
    [reflen=5] { shield-file: url(img/default-5.svg); }
    [reflen=6] { shield-file: url(img/default-6.svg); }
    [reflen=7] { shield-file: url(img/default-6.svg); }
    [reflen=8] { shield-file: url(img/default-6.svg); }
  }
  [zoom=11] { shield-min-distance: 120; } 
  [zoom=12] { shield-min-distance: 120; } 
  [zoom=13] { shield-min-distance: 120; }
  [zoom=14] { shield-min-distance: 180; }
}

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:"[name]";
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

#minorroad_label[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */
#motorway_label[zoom>=16],
#mainroad_label[zoom>=16],
#minorroad_label[zoom>=16] {
  [oneway = 'yes'],
  [oneway='-1'] {
     marker-placement:line;
     marker-max-error: 0.5;
     marker-spacing: 200;
     marker-file: url(img/icon/oneway.svg);
     [oneway='-1'] { marker-file: url(img/icon/oneway-reverse.svg); }
     [zoom=16] { marker-transform: "scale(0.5)"; }
     [zoom=17] { marker-transform: "scale(0.75)"; }
  }
}


/* ================================================================== */
/* TRAIN STATIONS
/* ================================================================== */

#train_stations[zoom>15]{
  point-file:url('img/icon/rail-12.png');
  [zoom>=17] { point-file:url('img/icon/rail-18.png'); }
}

/* ****************************************************************** */
/* ================================================================== */
/* NATURAL POINTS
/* ================================================================== */
#cliffs{
    [zoom=13] {
       marker-placement:line;
       marker-max-error: 0.5;
       marker-spacing: 0;
       marker-file: url('img/cliff_z13.png');
    }
   [zoom=14] {
       marker-placement:line;
       marker-max-error: 0.5;
       marker-spacing: 0.1;
       marker-file: url('img/cliff_z14.png');
    }
   [zoom>15] {
       line-pattern-file: url('img/my_cliff2.png');
    }
  }

#springs::labels[zoom>=15] {
    text-name:'[name]';
    text-face-name:@sans;
    text-size:10;
    [zoom>=16] { text-size:11; }
    text-fill: @water;// rgb(129,167,213); //#b3d6f6;
    text-halo-fill: rgb(129,167,213); //#b3d6f6;//@road_halo;
    text-halo-radius:0.4;
    text-placement: interior;
    text-dy: 7;
}
 
#natural_points["natural"='peak'][zoom>=13] {
      text-face-name:@sans;
      text-fill: #555555;
	  text-name: '[name]';
      text-placement: interior;
      text-dy: 7;
}

#natural_points["natural"='peak'][zoom>=14] {
      text-face-name:@sans;
      text-fill: #555555;
	  text-name: ''[name] + "\n" + [ele]'';
      text-placement: interior;
      text-dy: 7;
}


#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}