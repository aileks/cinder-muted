/* Cinder Muted colors for st.
 * Paste this into your config.def.h, replacing the colorname[] array
 * and the default/selection/highlight indexes. */

static const char *colorname[] = {
    /* 8 normal colors */
    "#15110F",
    "#A45751",
    "#D98C63",
    "#FFBD9B",
    "#C2764E",
    "#CA7D55",
    "#D2845C",
    "#B5A196",

    /* 8 bright colors */
    "#5F5049",
    "#F1A278",
    "#ED9F75",
    "#FFD4BE",
    "#D68960",
    "#DE9067",
    "#E6976E",
    "#E9D1C5",

    [255] = 0,

    /* more colors can be added after 255 to use with DefaultXX */
    "#E9D1C5", /* 256 -> cursor */
    "#15110F", /* 257 -> rev cursor*/
    "#15110F", /* 258 -> bg */
    "#B5A196", /* 259 -> fg */
    "#443831", /* 260 -> selection bg */
    "#F1A278", /* 261 -> search highlight bg */
};
