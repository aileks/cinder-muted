static char c000000[]                    = "#000000"; // placeholder value

static char normfgcolor[]                = "#E9D1C5";
static char normbgcolor[]                = "#15110F";
static char normbordercolor[]            = "#5F5049";
static char normfloatcolor[]             = "#5F5049";

static char selfgcolor[]                 = "#F1A278";
static char selbgcolor[]                 = "#15110F";
static char selbordercolor[]             = "#F1A278";
static char selfloatcolor[]              = "#F1A278";

static char titlenormfgcolor[]           = "#5F5049";
static char titlenormbgcolor[]           = "#15110F";
static char titlenormbordercolor[]       = "#5F5049";
static char titlenormfloatcolor[]        = "#5F5049";

static char titleselfgcolor[]            = "#E9D1C5";
static char titleselbgcolor[]            = "#15110F";
static char titleselbordercolor[]        = "#F1A278";
static char titleselfloatcolor[]         = "#F1A278";

static char tagsnormfgcolor[]            = "#E9D1C5";
static char tagsnormbgcolor[]            = "#15110F";
static char tagsnormbordercolor[]        = "#5F5049";
static char tagsnormfloatcolor[]         = "#5F5049";

static char tagsselfgcolor[]             = "#F1A278";
static char tagsselbgcolor[]             = "#15110F";
static char tagsselbordercolor[]         = "#F1A278";
static char tagsselfloatcolor[]          = "#F1A278";

static char hidnormfgcolor[]             = "#5F5049";
static char hidselfgcolor[]              = "#F1A278";
static char hidnormbgcolor[]             = "#15110F";
static char hidselbgcolor[]              = "#15110F";

static char urgfgcolor[]                 = "#E9D1C5";
static char urgbgcolor[]                 = "#A45751";
static char urgbordercolor[]             = "#A45751";
static char urgfloatcolor[]              = "#A45751";

static char *colors[][ColCount] = {
	/*                       fg                bg                border                float */
	[SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
	[SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
	[SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
	[SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
	[SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
	[SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
	[SchemeHidNorm]      = { hidnormfgcolor,   hidnormbgcolor,   c000000,              c000000 },
	[SchemeHidSel]       = { hidselfgcolor,    hidselbgcolor,    c000000,              c000000 },
	[SchemeUrg]          = { urgfgcolor,       urgbgcolor,       urgbordercolor,       urgfloatcolor },
};
