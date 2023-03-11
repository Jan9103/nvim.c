use crate::util::{o, g};
use nvim_oxi::api::{
	opts::SetHighlightOpts,
	set_hl,
};

const THEMENAME: &str = "mytheme";

const FOREGROUND: &str = "#f8f8f2";
const BACKGROUND: &str = "#282a36";
const SELECTION: &str = "#44475a";
const COMMENT: &str = "#6274a4";
const MENU: &str = "#21222c";
const VISUAL: &str = "#3e4452";
//const GUTTER_FG: &str = "#485263";
const NONTEXT: &str = "#3b4040";

const BLACK: &str = "#191a21";
//const BRIGHT_BLUE: &str = "#d6acff";
const BRIGHT_CYAN: &str = "#a4ffff";
const BRIGHT_GREEN: &str = "#69ff94";
//const BRIGHT_MAGENTA: &str = "#ff92df";
const BRIGHT_RED: &str = "#ff6e6e";
//const BRIGHT_WHITE: &str = "#ffffff";
//const BRIGHT_YELLOW: &str = "#ffffa5";
const CYAN: &str = "#88e9fd";
//const GRAY: &str = "#44475a";
const GREEN: &str = "#50fa7b";
const ORANGE: &str = "#ffb86c";
const PINK: &str = "#ff79c6";
const PURPLE: &str = "#bd93f9";
const RED: &str = "#ff5555";
const WHITE: &str = "#abb2bf";
const YELLOW: &str = "#f1fa8c";


fn hl(group: &str, opts: &SetHighlightOpts) {
	set_hl(0, group, opts).expect("Failed to set hl for colorscheme");
}

fn link(from: &str, to: &str) {
	hl(from, &SetHighlightOpts::builder().link(to).build());
}

pub fn init() {
	o("background", "dark");
	o("termguicolors", true);
	g("colors_name", THEMENAME);

	let black = SetHighlightOpts::builder().foreground(BLACK).ctermfg("black").build();
	let bright_cyan = SetHighlightOpts::builder().foreground(BRIGHT_CYAN).ctermfg("cyan").build();
	let bright_green = SetHighlightOpts::builder().foreground(BRIGHT_GREEN).ctermfg("green").build();
	let bright_red = SetHighlightOpts::builder().foreground(BRIGHT_RED).ctermfg("red").build();
	let bright_red_underline = SetHighlightOpts::builder().foreground(BRIGHT_RED).ctermfg("red").underline(true).build();
	let comment = SetHighlightOpts::builder().foreground(COMMENT).ctermfg("gray").build();
	let comment_italic = SetHighlightOpts::builder().foreground(COMMENT).ctermfg("gray").italic(true).build();
	let cyan = SetHighlightOpts::builder().foreground(CYAN).ctermfg("cyan").build();
	let cyan_italic = SetHighlightOpts::builder().foreground(CYAN).ctermfg("cyan").italic(true).build();
	let cyan_undercurl = SetHighlightOpts::builder().foreground(CYAN).ctermfg("cyan").undercurl(true).build();
	let cyan_underlined = SetHighlightOpts::builder().foreground(CYAN).ctermfg("blue").underline(true).build();
	let foreground = SetHighlightOpts::builder().foreground(FOREGROUND).ctermfg("white").build();
	let foreground_bold = SetHighlightOpts::builder().foreground(FOREGROUND).ctermfg("white").bold(true).build();
	let foreground_underline = SetHighlightOpts::builder().foreground(FOREGROUND).ctermfg("white").underline(true).build();
	let green = SetHighlightOpts::builder().foreground(GREEN).ctermfg("green").build();
	let green_italic = SetHighlightOpts::builder().foreground(GREEN).ctermfg("green").italic(true).build();
	let nontext = SetHighlightOpts::builder().foreground(NONTEXT).ctermfg("gray").build();
	let normal = SetHighlightOpts::builder().foreground(FOREGROUND).ctermfg("white").background(BACKGROUND).ctermbg("black").build();
	let orange = SetHighlightOpts::builder().foreground(ORANGE).ctermfg("yellow").build();
	let orange_bold = SetHighlightOpts::builder().foreground(ORANGE).ctermfg("yellow").bold(true).build();
	let orange_italic = SetHighlightOpts::builder().foreground(ORANGE).ctermfg("yellow").italic(true).build();
	let orange_underline = SetHighlightOpts::builder().foreground(ORANGE).ctermfg("yellow").underline(true).build();
	let pink = SetHighlightOpts::builder().foreground(PINK).ctermfg("red").build();
	let pink_bold = SetHighlightOpts::builder().foreground(PINK).ctermfg("red").bold(true).build();
	let purple = SetHighlightOpts::builder().foreground(PURPLE).ctermfg("blue").build();
	let purple_bold_italic = SetHighlightOpts::builder().foreground(PURPLE).ctermfg("blue").italic(true).bold(true).build();
	let purple_italic = SetHighlightOpts::builder().foreground(PURPLE).ctermfg("blue").italic(true).build();
	let purple_underline = SetHighlightOpts::builder().foreground(PURPLE).ctermfg("blue").underline(true).build();
	let red = SetHighlightOpts::builder().foreground(RED).ctermfg("red").build();
	let red_undercurl = SetHighlightOpts::builder().foreground(RED).ctermfg("red").undercurl(true).build();
	let white = SetHighlightOpts::builder().foreground(WHITE).ctermfg("white").build();
	let yellow = SetHighlightOpts::builder().foreground(YELLOW).ctermfg("yellow").build();
	let yellow_bold = SetHighlightOpts::builder().foreground(YELLOW).ctermfg("yellow").bold(true).build();
	let yellow_italic = SetHighlightOpts::builder().foreground(YELLOW).ctermfg("yellow").italic(true).build();
	let yellow_undercurl = SetHighlightOpts::builder().foreground(YELLOW).ctermfg("yellow").undercurl(true).build();

	hl("Normal", &normal);
	hl("NormalFloat", &normal);
	hl("Comment", &comment);
	hl("Constant", &yellow);
	hl("String", &yellow);
	hl("Character", &green);
	hl("Number", &orange);
	hl("Boolean", &cyan);
	hl("Float", &orange);
	hl("FloatBorder", &white);
	hl("Operator", &purple);
	hl("Keyword", &cyan);
	hl("Keywords", &cyan);
	hl("Identifier", &cyan);
	hl("Function", &yellow);
	hl("Statement", &purple);
	hl("Conditional", &pink);
	hl("Repeat", &pink);
	hl("Label", &cyan);
	hl("Exception", &purple);
	hl("PreProc", &yellow);
	hl("Include", &purple);
	hl("Define", &purple);
	hl("Title", &cyan);
	hl("Macro", &purple);
	hl("PreCondit", &cyan);
	hl("Type", &cyan);
	hl("StorageClass", &pink);
	hl("Structure", &yellow);
	hl("TypeDef", &yellow);
	hl("Special", &green_italic);
	hl("SpecialComment", &comment_italic);
	hl("Error", &bright_red);
	hl("Todo", &purple_bold_italic);
	hl("Underlined", &cyan_underlined);

	hl("Cursor", &SetHighlightOpts::builder().reverse(true).build());
	hl("CursorLineNr", &foreground_bold);
	hl("SignColumn", &SetHighlightOpts::builder().background(BACKGROUND).ctermbg("black").build());
	hl("Conceal", &comment);

	hl("Directory", &cyan);
	hl("DiffAdd", &SetHighlightOpts::builder().background(GREEN).ctermbg("green").foreground(BACKGROUND).ctermfg("black").build());
	hl("DiffChange", &orange);
	hl("DiffDelete", &red);
	hl("DiffText", &comment);

	hl("ErrorMsg", &bright_red);
	hl("VertSplit", &black);
	hl("Folded", &comment);
	hl("FoldColumn", &SetHighlightOpts::builder().build());
	hl("Search", &SetHighlightOpts::builder().foreground(BLACK).ctermfg("black").background(ORANGE).ctermbg("yellow").build());
	hl("IncSearch", &SetHighlightOpts::builder().foreground(ORANGE).ctermfg("yellow").ctermbg("black").background(COMMENT).build());
	hl("LineNr", &comment);
	hl("MatchParen", &foreground_underline);
	hl("NonText", &SetHighlightOpts::builder().foreground(NONTEXT).ctermfg("white").build());
	hl("Pmenu", &SetHighlightOpts::builder().foreground(WHITE).ctermfg("white").background(MENU).ctermbg("gray").build());
	hl("PmenuSel", &SetHighlightOpts::builder().foreground(WHITE).ctermfg("white").background(SELECTION).ctermbg("yellow").build());
	hl("PmenuSbar", &SetHighlightOpts::builder().background(BACKGROUND).ctermbg("black").build());
	hl("PmenuThumb", &SetHighlightOpts::builder().background(SELECTION).ctermbg("gray").build());

	hl("Question", &purple);
	hl("QuickFixLine", &SetHighlightOpts::builder().foreground(BLACK).ctermfg("black").background(YELLOW).ctermbg("yellow").build());
	hl("SpecialKey", &SetHighlightOpts::builder().foreground(NONTEXT).ctermfg("gray").build());

	hl("SpellBad", &bright_red_underline);
	hl("SpellCap", &yellow);
	hl("SpellLocal", &yellow);
	hl("SpellRare", &yellow);

	hl("Terminal", &SetHighlightOpts::builder().foreground(WHITE).ctermfg("white").background(BLACK).ctermbg("black").build());
	hl("Visual", &SetHighlightOpts::builder().background(VISUAL).ctermbg("gray").build());
	hl("VisualNOS", &SetHighlightOpts::builder().foreground(VISUAL).ctermfg("gray").build());
	hl("WarningMsg", &yellow);
	hl("WildMenu", &SetHighlightOpts::builder().foreground(BLACK).ctermfg("black").background(WHITE).ctermbg("white").build());

	hl("@error", &bright_red);
	hl("@constant.builtin", &purple);
	hl("@symbol", &purple);
	hl("@constant.macro", &cyan);
	hl("@string.regex", &red);
	hl("@string", &yellow);
	hl("@string.escape", &cyan);
	hl("@character", &green);
	hl("@number", &purple);
	hl("@boolean", &purple);
	hl("@float", &green);
	hl("@annotation", &yellow);
	hl("@attribute", &cyan);
	hl("@namespace", &orange);

	hl("@function.builtin", &cyan);
	hl("@function", &green);
	hl("@function.macro", &green);
	hl("@parameter", &orange);
	hl("@parameter.reference", &orange);
	hl("@method", &green);
	hl("@field", &orange);
	hl("@property", &purple);
	hl("@constructor", &cyan);

	hl("@conditional", &pink);
	hl("@repeat", &pink);
	hl("@label", &cyan);

	hl("@keyword", &pink);
	hl("@keyword.function", &cyan);
	hl("@keyword.operator", &pink);
	hl("@operator", &pink);
	hl("@exception", &purple);
	hl("@type", &bright_cyan);
	hl("@type.builtin", &cyan_italic);
	hl("@type.qualifier", &pink);
	hl("@structure", &purple);
	hl("@include", &pink);

	hl("@variable", &foreground);
	hl("@variable.builtin", &purple);

	hl("@text", &orange);
	hl("@text.strong", &orange_bold);
	hl("@text.emphasis", &orange_italic);
	hl("@text.underline", &orange_underline);
	hl("@text.title", &purple_bold_italic);
	hl("@text.literal", &yellow);
	hl("@text.uri", &yellow_italic);
	hl("@text.reference", &orange_bold);

	hl("@tag", &cyan);
	hl("@tag.attribute", &green);
	hl("@tag.delimiter", &cyan);

	hl("@class", &cyan);
	hl("@struct", &cyan);
	hl("@enum", &cyan);
	hl("@enumMember", &purple);
	hl("@event", &cyan);
	hl("@interface", &cyan);
	hl("@modifier", &cyan);
	hl("@regexp", &yellow);
	hl("@typeParameter", &cyan);
	hl("@decorator", &cyan);

	hl("htmlArg", &green);
	hl("htmlBold", &yellow_bold);
	hl("htmlEndTag", &cyan);
	for i in 1..6 {hl(format!("htmlH{}", i).as_str(), &pink);}
	hl("htmlItalic", &purple_italic);
	hl("htmlLink", &purple_underline);
	hl("htmlSpecialChar", &yellow);
	hl("htmlSpecialTagName", &cyan);
	hl("htmlTag", &cyan);
	hl("htmlTagN", &cyan);
	hl("htmlTagName", &cyan);
	hl("htmlTitle", &white);

	hl("markdownBlockquote", &yellow_italic);
	hl("markdownBold", &orange_bold);
	hl("markdownCode", &green);
	hl("markdownCodeBlock", &orange);
	hl("markdownCodeDelimiter", &red);
	for i in 1..6 {hl(format!("markdownH{}", i).as_str(), &pink_bold);}
	hl("markdownHeadingDelimiter", &red);
	hl("markdownHeadingRule", &comment);
	hl("markdownId", &purple);
	hl("markdownIdDeclaration", &cyan);
	hl("markdownIdDelimiter", &purple);
	hl("markdownItalic", &yellow_italic);
	hl("markdownLinkDelimiter", &purple);
	hl("markdownLinkText", &pink);
	hl("markdownListMarker", &red);
	hl("markdownOrderedListMarker", &red);
	hl("markdownRule", &comment);

	hl("diffAdded", &green);
	hl("diffRemoved", &red);
	hl("diffFileId", &yellow_bold);
	hl("diffFile", &nontext);
	hl("diffNewFile", &green);
	hl("diffOldFile", &red);

	hl("debugPc", &cyan);
	hl("debugBreakpoint", &red);

	hl("GitSignsAdd", &bright_green);
	hl("GitSignsChange", &cyan);
	hl("GitSignsDelete", &bright_red);
	hl("GitSignsAddLn", &bright_green);
	hl("GitSignsChangeLn", &cyan);
	hl("GitSignsDeleteLn", &bright_red);
	hl("GitSignsCurrentLineBlame", &white);

	hl("TelescopePromptBorder", &comment);
	hl("TelescopeResultsBorder", &comment);
	hl("TelescopePreviewBorder", &comment);
	hl("TelescopeSelection", &SetHighlightOpts::builder().foreground(WHITE).ctermfg("white").background(SELECTION).ctermbg("gray").build());
	hl("TelescopeMultiSelection", &SetHighlightOpts::builder().foreground(PURPLE).ctermfg("blue").background(SELECTION).ctermbg("gray").build());
	hl("TelescopeNormal", &normal);
	hl("TelescopeMatching", &green);
	hl("TelescopePromptPrefix", &purple);

	hl("DiagnosticError", &red);
	hl("DiagnosticWarn", &yellow);
	hl("DiagnosticInfo", &cyan);
	hl("DiagnosticHint", &cyan);
	hl("DiagnosticUnderlineError", &red_undercurl);
	hl("DiagnosticUnderlineWarn", &yellow_undercurl);
	hl("DiagnosticUnderlineInfo", &cyan_undercurl);
	hl("DiagnosticUnderlineHint", &cyan_undercurl);
	hl("DiagnosticSignError", &red);
	hl("DiagnosticSignWarn", &yellow);
	hl("DiagnosticSignInfo", &cyan);
	hl("DiagnosticSignHint", &cyan);
	hl("DiagnosticFloatingError", &red);
	hl("DiagnosticFloatingWarn", &yellow);
	hl("DiagnosticFloatingInfo", &cyan);
	hl("DiagnosticFloatingHint", &cyan);
	hl("DiagnosticVirtualTextError", &red);
	hl("DiagnosticVirtualTextWarn", &yellow);
	hl("DiagnosticVirtualTextInfo", &cyan);
	hl("DiagnosticVirtualTextHint", &cyan);

	hl("LspDiagnosticsDefaultError", &red);
	hl("LspDiagnosticsDefaultWarning", &yellow);
	hl("LspDiagnosticsDefaultInformation", &cyan);
	hl("LspDiagnosticsDefaultHint", &cyan);
	hl("LspDiagnosticsUnderlineError", &red_undercurl);
	hl("LspDiagnosticsUnderlineWarning", &yellow_undercurl);
	hl("LspDiagnosticsUnderlineInformation", &cyan_undercurl);
	hl("LspDiagnosticsUnderlineHint", &cyan_undercurl);
	hl("LspReferenceText", &orange);
	hl("LspReferenceRead", &orange);
	hl("LspReferenceWrite", &orange);

	hl("IndentBlanklineContextChar", &SetHighlightOpts::builder().foreground(BRIGHT_RED).ctermfg("red").nocombine(true).build());

	link("IndentBlanklineContextChar", "Pmenu");
	link("CmpItemAbbr", "Pmenu");
	link("CmpItemKindMethod", "@method");
	link("CmpItemKindText", "@text");
	link("CmpItemKindFunction", "@function");
	link("CmpItemKindConstructor", "@type");
	link("CmpItemKindVariable", "@variable");
	link("CmpItemKindClass", "@type");
	link("CmpItemKindInterface", "@type");
	link("CmpItemKindModule", "@namespace");
	link("CmpItemKindProperty", "@property");
	link("CmpItemKindOperator", "@operator");
	link("CmpItemKindReference", "@parameter.reference");
	link("CmpItemKindUnit", "@field");
	link("CmpItemKindValue", "@field");
	link("CmpItemKindField", "@field");
	link("CmpItemKindEnum", "@field");
	link("CmpItemKindKeyword", "@keyword");
	link("CmpItemKindSnippet", "@text");
	link("CmpItemKindColor", "@DecIconCss");
	link("CmpItemKindFile", "TSURI");
	link("CmpItemKindFolder", "TSURI");
	link("CmpItemKindEvent", "@constant");
	link("CmpItemKindEnumMember", "@field");
	link("CmpItemKindConstant", "constant");
	link("CmpItemKindStruct", "@constant");
	link("CmpItemKindStruct", "@structure");
	link("CmpItemKindTypeParameter", "@parameter");

	hl("rainbowcol1", &red);
	hl("rainbowcol2", &green);
	hl("rainbowcol3", &yellow);
	hl("rainbowcol4", &purple);
	hl("rainbowcol5", &pink);
	hl("rainbowcol6", &cyan);
	hl("rainbowcol7", &white);
}
