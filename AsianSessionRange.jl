//@version=4
study("FXN - Asian Session Range", shorttitle= "Asian Session Range", overlay=true)
//*************************************
// Discontinued Indicator - No Longer supported. Please update to by using the latest version now called "Diddly - Charts (Asian, London & New York Session + Weekdays)"
//*************************************

// Get User Inputs
user_ssth = input(title="Start Session Hour (EST)", defval="20", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
user_sstm = input(title="Start Session Minute (EST)", defval="00", options=["00", "15", "30", "45"])

user_esth = input(title="End Session Hour (EST)", defval="02", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
user_estm = input(title="End Session Minute (EST)", defval="00", options=["00", "15", "30", "45"])

user_elth = input(title="Extend Session Lines Until Hour (EST)", defval="11", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
user_eltm = input(title="Extend Session Lines Until Minute (EST)", defval="30", options=["00", "15", "30", "45"])



user_box_line_color = input(title="Asian Range Border Color", defval="blue", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
boxLineWidth = input(title="Asian Box Line Width", defval=1, minval=0, maxval=10)
user_box_line_style = input(title="Asian Box Line Style", defval="solid", options=["solid", "dashed", "dotted"])

sessionLineWidth = input(title="Session High / Low / Mid Line Width", defval=2, minval=0, maxval=20)
user_upperlower_line_style = input(title="Session High / Low Line Style", defval="dotted", options=["solid", "dashed", "dotted"])

user_midline_color = input(title="Middle Range Line Color", defval="orange", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
user_middle_line_style = input(title="Middle Range Line Style", defval="dotted", options=["solid", "dashed", "dotted"])

user_text_color = input(title="Text Color", defval="blue", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
user_label_size = input(title="Text Size", defval="normal", options=["tiny", "small", "normal", "large"])


// London Session Inputs
show_london_session = input(defval=true, type=input.bool, title="Show London Session Box")
show_london_session_rng = input(defval=true, type=input.bool, title="Show London Session Range Pips")


london_ssth = input(title="London Start Hour (EST)", defval="03", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
london_sstm = input(title="London Start Minute (EST)", defval="00", options=["00", "15", "30", "45"])

london_esth = input(title="London End Hour (EST)", defval="07", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
london_estm = input(title="London End Minute (EST)", defval="00", options=["00", "15", "30", "45"])


luser_box_line_color = input(title="London Range Border Color", defval="teal", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
lboxLineWidth = input(title="London Box Line Width", defval=1, minval=0, maxval=10)
luser_box_line_style = input(title="London Box Line Style", defval="solid", options=["solid", "dashed", "dotted"])

lsessionLineWidth = input(title="Session High / Low / Mid Line Width", defval=2, minval=0, maxval=20)
luser_upperlower_line_style = input(title="Session High / Low Line Style", defval="dotted", options=["solid", "dashed", "dotted"])

luser_midline_color = input(title="Middle Range Line Color", defval="teal", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
luser_middle_line_style = input(title="Middle Range Line Style", defval="dotted", options=["solid", "dashed", "dotted"])

luser_text_color = input(title="Text Color", defval="teal", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
luser_label_size = input(title="Text Size", defval="normal", options=["tiny", "small", "normal", "large"])

// End London


// New York Session Inputs
show_ny_session = input(defval=true, type=input.bool, title="Show New York Session Box")
show_ny_session_rng = input(defval=true, type=input.bool, title="Show New York Session Range Pips")

ny_ssth = input(title="New York Start Hour (EST)", defval="08", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
ny_sstm = input(title="New York Start Minute (EST)", defval="00", options=["00", "15", "30", "45"])

ny_esth = input(title="New York End Hour (EST)", defval="12", options=["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
ny_estm = input(title="New York End Minute (EST)", defval="00", options=["00", "15", "30", "45"])


nuser_box_line_color = input(title="New York Range Border Color", defval="silver", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
nboxLineWidth = input(title="New York Box Line Width", defval=1, minval=0, maxval=10)
nuser_box_line_style = input(title="New York Box Line Style", defval="solid", options=["solid", "dashed", "dotted"])

nsessionLineWidth = input(title="Session High / Low / Mid Line Width", defval=2, minval=0, maxval=20)
nuser_upperlower_line_style = input(title="Session High / Low Line Style", defval="dotted", options=["solid", "dashed", "dotted"])

nuser_midline_color = input(title="Middle Range Line Color", defval="silver", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
nuser_middle_line_style = input(title="Middle Range Line Style", defval="dotted", options=["solid", "dashed", "dotted"])

nuser_text_color = input(title="Text Color", defval="silver", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
nuser_label_size = input(title="Text Size", defval="normal", options=["tiny", "small", "normal", "large"])

showADR = input(defval=true, type=input.bool, title="Show Average Daily Range")
is_forex_pips = input(title="Display average range as forex pips?", type=input.bool, defval=true)
daily_adr_user = input(title="Show ADR for x days", type=input.integer, defval=1, minval=0)
daily_adr_length = input(title="ADR Length parameter (Days - default 3 weeks, 21 days)", type=input.integer, defval=21, minval=0)

showPreviousDayHiLo = input(defval=true, type=input.bool, title="Show Previous Days High / Low")
previousDayHiLoColor = input(title="Previous Days Line Color", defval="yellow", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
supportLineWidth = input(title="Previous Days Line Width", defval=1, minval=0, maxval=10)
previousDayHiLoLineStyle = input(title="Previous Days Line Style", defval="dashed", options=["solid", "dashed", "dotted"])
showHiLoPriceRange = input(defval=false, type=input.bool, title="Show Previous Days Range")
showHiLoPriceLabel = input(defval=false, type=input.bool, title="Show Line Label (YH / YL)")


showLastWeeklyHiLo = input(defval=true, type=input.bool, title="Show Last Weeks High / Low")
lastWeeklyHiLoColor = input(title="Last Week Line Color", defval="orange", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
supportLastWeekLineWidth = input(title="Last Week Line Width", defval=1, minval=0, maxval=10)
lastWeeklyHiLoStyle = input(title="Last Week Line Style", defval="dashed", options=["solid", "dashed", "dotted"])
lastWeeklyHiLoShowLabel = input(defval=true, type=input.bool, title="Show Line Label (PWH / PWL)")


showWeeklyHiLo = input(defval=false, type=input.bool, title="Show This Weeks High / Low")
weeklyHiLoColor = input(title="This Weeks Line Color", defval="olive", options=["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive", "orange", "purple", "red", "silver", "teal", "white", "yellow"])
supportWeekLineWidth = input(title="This Weeks Line Width", defval=1, minval=0, maxval=10)
weeklyHiLoStyle = input(title="This Weeks Line Style", defval="dashed", options=["solid", "dashed", "dotted"])
weeklyHiLoShowLabel = input(defval=false, type=input.bool, title="Show Line Label (WH / WL)")

showHiLoTime = input(defval=false, type=input.bool, title="Show Hi / Low Time of Day (Always Displays Eastern Standard Time)")


// End User Inputs

// Asian Input Convertions
line_color = user_box_line_color == "aqua" ? color.aqua : user_box_line_color == "black" ? color.black : user_box_line_color == "blue" ? color.blue : user_box_line_color == "fuchsia" ? color.fuchsia : user_box_line_color == "gray" ? color.gray : user_box_line_color == "green" ? color.green : user_box_line_color == "lime" ? color.lime : user_box_line_color == "maroon" ? color.maroon : user_box_line_color == "navy" ? color.navy : user_box_line_color == "olive" ? color.olive : user_box_line_color == "orange" ? color.orange : user_box_line_color == "purple" ? color.purple : user_box_line_color == "red" ? color.red : user_box_line_color == "silver" ? color.silver : user_box_line_color == "teal" ? color.teal : user_box_line_color == "white" ? color.white : user_box_line_color == "yellow" ? color.yellow : color.black
midline_color = user_midline_color == "aqua" ? color.aqua : user_midline_color == "black" ? color.black : user_midline_color == "blue" ? color.blue : user_midline_color == "fuchsia" ? color.fuchsia : user_midline_color == "gray" ? color.gray : user_midline_color == "green" ? color.green : user_midline_color == "lime" ? color.lime : user_midline_color == "maroon" ? color.maroon : user_midline_color == "navy" ? color.navy : user_midline_color == "olive" ? color.olive : user_midline_color == "orange" ? color.orange : user_midline_color == "purple" ? color.purple : user_midline_color == "red" ? color.red : user_midline_color == "silver" ? color.silver : user_midline_color == "teal" ? color.teal : user_midline_color == "white" ? color.white : user_midline_color == "yellow" ? color.yellow : color.black
text_color = user_text_color == "aqua" ? color.aqua : user_text_color == "black" ? color.black : user_text_color == "blue" ? color.blue : user_text_color == "fuchsia" ? color.fuchsia : user_text_color == "gray" ? color.gray : user_text_color == "green" ? color.green : user_text_color == "lime" ? color.lime : user_text_color == "maroon" ? color.maroon : user_text_color == "navy" ? color.navy : user_text_color == "olive" ? color.olive : user_text_color == "orange" ? color.orange : user_text_color == "purple" ? color.purple : user_text_color == "red" ? color.red : user_text_color == "silver" ? color.silver : user_text_color == "teal" ? color.teal : user_text_color == "white" ? color.white : user_text_color == "yellow" ? color.yellow : color.black

box_line_style = user_box_line_style == "solid" ? line.style_solid : user_box_line_style == "dashed" ? line.style_dashed : user_box_line_style == "dotted" ? line.style_dotted : line.style_solid
upperlower_line_style = user_upperlower_line_style == "solid" ? line.style_solid : user_upperlower_line_style == "dashed" ? line.style_dashed : user_upperlower_line_style == "dotted" ? line.style_dotted : line.style_solid
middle_line_style = user_middle_line_style == "solid" ? line.style_solid : user_middle_line_style == "dashed" ? line.style_dashed : user_middle_line_style == "dotted" ? line.style_dotted : line.style_solid

labelsize = user_label_size == "tiny" ? size.tiny : user_label_size == "small" ? size.small : user_label_size == "normal" ? size.normal : user_label_size == "large" ? size.large : size.normal
//

// London Input Convertions
lline_color = luser_box_line_color == "aqua" ? color.aqua : luser_box_line_color == "black" ? color.black : luser_box_line_color == "blue" ? color.blue : luser_box_line_color == "fuchsia" ? color.fuchsia : luser_box_line_color == "gray" ? color.gray : luser_box_line_color == "green" ? color.green : luser_box_line_color == "lime" ? color.lime : luser_box_line_color == "maroon" ? color.maroon : luser_box_line_color == "navy" ? color.navy : luser_box_line_color == "olive" ? color.olive : luser_box_line_color == "orange" ? color.orange : luser_box_line_color == "purple" ? color.purple : luser_box_line_color == "red" ? color.red : luser_box_line_color == "silver" ? color.silver : luser_box_line_color == "teal" ? color.teal : luser_box_line_color == "white" ? color.white : luser_box_line_color == "yellow" ? color.yellow : color.black
lmidline_color = luser_midline_color == "aqua" ? color.aqua : luser_midline_color == "black" ? color.black : luser_midline_color == "blue" ? color.blue : luser_midline_color == "fuchsia" ? color.fuchsia : luser_midline_color == "gray" ? color.gray : luser_midline_color == "green" ? color.green : luser_midline_color == "lime" ? color.lime : luser_midline_color == "maroon" ? color.maroon : luser_midline_color == "navy" ? color.navy : luser_midline_color == "olive" ? color.olive : luser_midline_color == "orange" ? color.orange : luser_midline_color == "purple" ? color.purple : luser_midline_color == "red" ? color.red : luser_midline_color == "silver" ? color.silver : luser_midline_color == "teal" ? color.teal : luser_midline_color == "white" ? color.white : luser_midline_color == "yellow" ? color.yellow : color.black
ltext_color = luser_text_color == "aqua" ? color.aqua : luser_text_color == "black" ? color.black : luser_text_color == "blue" ? color.blue : luser_text_color == "fuchsia" ? color.fuchsia : luser_text_color == "gray" ? color.gray : luser_text_color == "green" ? color.green : luser_text_color == "lime" ? color.lime : luser_text_color == "maroon" ? color.maroon : luser_text_color == "navy" ? color.navy : luser_text_color == "olive" ? color.olive : luser_text_color == "orange" ? color.orange : luser_text_color == "purple" ? color.purple : luser_text_color == "red" ? color.red : luser_text_color == "silver" ? color.silver : luser_text_color == "teal" ? color.teal : luser_text_color == "white" ? color.white : luser_text_color == "yellow" ? color.yellow : color.black

lbox_line_style = luser_box_line_style == "solid" ? line.style_solid : luser_box_line_style == "dashed" ? line.style_dashed : luser_box_line_style == "dotted" ? line.style_dotted : line.style_solid
lupperlower_line_style = luser_upperlower_line_style == "solid" ? line.style_solid : luser_upperlower_line_style == "dashed" ? line.style_dashed : luser_upperlower_line_style == "dotted" ? line.style_dotted : line.style_solid
lmiddle_line_style = luser_middle_line_style == "solid" ? line.style_solid : luser_middle_line_style == "dashed" ? line.style_dashed : luser_middle_line_style == "dotted" ? line.style_dotted : line.style_solid

llabelsize = luser_label_size == "tiny" ? size.tiny : luser_label_size == "small" ? size.small : luser_label_size == "normal" ? size.normal : luser_label_size == "large" ? size.large : size.normal
//

// New York Input Convertions
nline_color = nuser_box_line_color == "aqua" ? color.aqua : nuser_box_line_color == "black" ? color.black : nuser_box_line_color == "blue" ? color.blue : nuser_box_line_color == "fuchsia" ? color.fuchsia : nuser_box_line_color == "gray" ? color.gray : nuser_box_line_color == "green" ? color.green : nuser_box_line_color == "lime" ? color.lime : nuser_box_line_color == "maroon" ? color.maroon : nuser_box_line_color == "navy" ? color.navy : nuser_box_line_color == "olive" ? color.olive : nuser_box_line_color == "orange" ? color.orange : nuser_box_line_color == "purple" ? color.purple : nuser_box_line_color == "red" ? color.red : nuser_box_line_color == "silver" ? color.silver : nuser_box_line_color == "teal" ? color.teal : nuser_box_line_color == "white" ? color.white : nuser_box_line_color == "yellow" ? color.yellow : color.black
nmidline_color = nuser_midline_color == "aqua" ? color.aqua : nuser_midline_color == "black" ? color.black : nuser_midline_color == "blue" ? color.blue : nuser_midline_color == "fuchsia" ? color.fuchsia : nuser_midline_color == "gray" ? color.gray : nuser_midline_color == "green" ? color.green : nuser_midline_color == "lime" ? color.lime : nuser_midline_color == "maroon" ? color.maroon : nuser_midline_color == "navy" ? color.navy : nuser_midline_color == "olive" ? color.olive : nuser_midline_color == "orange" ? color.orange : nuser_midline_color == "purple" ? color.purple : nuser_midline_color == "red" ? color.red : nuser_midline_color == "silver" ? color.silver : nuser_midline_color == "teal" ? color.teal : nuser_midline_color == "white" ? color.white : nuser_midline_color == "yellow" ? color.yellow : color.black
ntext_color = nuser_text_color == "aqua" ? color.aqua : nuser_text_color == "black" ? color.black : nuser_text_color == "blue" ? color.blue : nuser_text_color == "fuchsia" ? color.fuchsia : nuser_text_color == "gray" ? color.gray : nuser_text_color == "green" ? color.green : nuser_text_color == "lime" ? color.lime : nuser_text_color == "maroon" ? color.maroon : nuser_text_color == "navy" ? color.navy : nuser_text_color == "olive" ? color.olive : nuser_text_color == "orange" ? color.orange : nuser_text_color == "purple" ? color.purple : nuser_text_color == "red" ? color.red : nuser_text_color == "silver" ? color.silver : nuser_text_color == "teal" ? color.teal : nuser_text_color == "white" ? color.white : nuser_text_color == "yellow" ? color.yellow : color.black

nbox_line_style = nuser_box_line_style == "solid" ? line.style_solid : nuser_box_line_style == "dashed" ? line.style_dashed : nuser_box_line_style == "dotted" ? line.style_dotted : line.style_solid
nupperlower_line_style = nuser_upperlower_line_style == "solid" ? line.style_solid : nuser_upperlower_line_style == "dashed" ? line.style_dashed : nuser_upperlower_line_style == "dotted" ? line.style_dotted : line.style_solid
nmiddle_line_style = nuser_middle_line_style == "solid" ? line.style_solid : nuser_middle_line_style == "dashed" ? line.style_dashed : nuser_middle_line_style == "dotted" ? line.style_dotted : line.style_solid

nlabelsize = nuser_label_size == "tiny" ? size.tiny : nuser_label_size == "small" ? size.small : nuser_label_size == "normal" ? size.normal : nuser_label_size == "large" ? size.large : size.normal

// ADR Reset Period for Weekend
// If weekend then need to adjust
// the user input period for how long
// back they want to see the ADR
daily_adr = daily_adr_user
if (dayofweek.sunday)
    daily_adr := daily_adr + 1
if (dayofweek.saturday)
    daily_adr := daily_adr + 1
//

// High Low Support / resistance
lblTP = 70

support_line_color = previousDayHiLoColor == "aqua" ? color.aqua : previousDayHiLoColor == "black" ? color.black : previousDayHiLoColor == "blue" ? color.blue : previousDayHiLoColor == "fuchsia" ? color.fuchsia : previousDayHiLoColor == "gray" ? color.gray : previousDayHiLoColor == "green" ? color.green : previousDayHiLoColor == "lime" ? color.lime : previousDayHiLoColor == "maroon" ? color.maroon : previousDayHiLoColor == "navy" ? color.navy : previousDayHiLoColor == "olive" ? color.olive : previousDayHiLoColor == "orange" ? color.orange : previousDayHiLoColor == "purple" ? color.purple : previousDayHiLoColor == "red" ? color.red : previousDayHiLoColor == "silver" ? color.silver : previousDayHiLoColor == "teal" ? color.teal : previousDayHiLoColor == "white" ? color.white : previousDayHiLoColor == "yellow" ? color.yellow : color.black
support_line_label_color = previousDayHiLoColor == "aqua" ? color.new(color.aqua,lblTP) : previousDayHiLoColor == "black" ? color.new(color.black,lblTP) : previousDayHiLoColor == "blue" ? color.new(color.blue,lblTP) : previousDayHiLoColor == "fuchsia" ? color.new(color.fuchsia,lblTP) : previousDayHiLoColor == "gray" ? color.new(color.gray,lblTP) : previousDayHiLoColor == "green" ? color.new(color.green,lblTP) : previousDayHiLoColor == "lime" ? color.new(color.lime,lblTP) : previousDayHiLoColor == "maroon" ? color.new(color.maroon,lblTP) : previousDayHiLoColor == "navy" ? color.new(color.navy,lblTP) : previousDayHiLoColor == "olive" ? color.new(color.olive,lblTP) : previousDayHiLoColor == "orange" ? color.new(color.orange,lblTP) : previousDayHiLoColor == "purple" ? color.new(color.purple,lblTP) : previousDayHiLoColor == "red" ? color.new(color.red,lblTP) : previousDayHiLoColor == "silver" ? color.new(color.silver,lblTP) : previousDayHiLoColor == "teal" ? color.new(color.teal,lblTP) : previousDayHiLoColor == "white" ? color.new(color.white,lblTP) : previousDayHiLoColor == "yellow" ? color.new(color.yellow,lblTP) : color.new(color.black,lblTP)

support_line_style = previousDayHiLoLineStyle == "solid" ? line.style_solid : previousDayHiLoLineStyle == "dashed" ? line.style_dashed : previousDayHiLoLineStyle == "dotted" ? line.style_dotted : line.style_solid


support_last_week_line_color = lastWeeklyHiLoColor == "aqua" ? color.aqua : lastWeeklyHiLoColor == "black" ? color.black : lastWeeklyHiLoColor == "blue" ? color.blue : lastWeeklyHiLoColor == "fuchsia" ? color.fuchsia : lastWeeklyHiLoColor == "gray" ? color.gray : lastWeeklyHiLoColor == "green" ? color.green : lastWeeklyHiLoColor == "lime" ? color.lime : lastWeeklyHiLoColor == "maroon" ? color.maroon : lastWeeklyHiLoColor == "navy" ? color.navy : lastWeeklyHiLoColor == "olive" ? color.olive : lastWeeklyHiLoColor == "orange" ? color.orange : lastWeeklyHiLoColor == "purple" ? color.purple : lastWeeklyHiLoColor == "red" ? color.red : lastWeeklyHiLoColor == "silver" ? color.silver : lastWeeklyHiLoColor == "teal" ? color.teal : lastWeeklyHiLoColor == "white" ? color.white : lastWeeklyHiLoColor == "yellow" ? color.yellow : color.black
support_last_week_line_label_color = lastWeeklyHiLoColor == "aqua" ? color.new(color.aqua,lblTP) : lastWeeklyHiLoColor == "black" ? color.new(color.black,lblTP) : lastWeeklyHiLoColor == "blue" ? color.new(color.blue,lblTP) : lastWeeklyHiLoColor == "fuchsia" ? color.new(color.fuchsia,lblTP) : lastWeeklyHiLoColor == "gray" ? color.new(color.gray,lblTP) : lastWeeklyHiLoColor == "green" ? color.new(color.green,lblTP) : lastWeeklyHiLoColor == "lime" ? color.new(color.lime,lblTP) : lastWeeklyHiLoColor == "maroon" ? color.new(color.maroon,lblTP) : lastWeeklyHiLoColor == "navy" ? color.new(color.navy,lblTP) : lastWeeklyHiLoColor == "olive" ? color.new(color.olive,lblTP) : lastWeeklyHiLoColor == "orange" ? color.new(color.orange,lblTP) : lastWeeklyHiLoColor == "purple" ? color.new(color.purple,lblTP) : lastWeeklyHiLoColor == "red" ? color.new(color.red,lblTP) : lastWeeklyHiLoColor == "silver" ? color.new(color.silver,lblTP) : lastWeeklyHiLoColor == "teal" ? color.new(color.teal,lblTP) : lastWeeklyHiLoColor == "white" ? color.new(color.white,lblTP) : lastWeeklyHiLoColor == "yellow" ? color.new(color.yellow,lblTP) : color.new(color.black,lblTP)

support_last_week_line_style = lastWeeklyHiLoStyle == "solid" ? line.style_solid : lastWeeklyHiLoStyle == "dashed" ? line.style_dashed : lastWeeklyHiLoStyle == "dotted" ? line.style_dotted : line.style_solid

wlineTP = 30
support_week_line_color = weeklyHiLoColor == "aqua" ? color.new(color.aqua,wlineTP) : weeklyHiLoColor == "black" ? color.new(color.black,wlineTP) : weeklyHiLoColor == "blue" ? color.new(color.blue,wlineTP) : weeklyHiLoColor == "fuchsia" ? color.new(color.fuchsia,wlineTP) : weeklyHiLoColor == "gray" ? color.new(color.gray,wlineTP) : weeklyHiLoColor == "green" ? color.new(color.green,wlineTP) : weeklyHiLoColor == "lime" ? color.new(color.lime,wlineTP) : weeklyHiLoColor == "maroon" ? color.new(color.maroon,wlineTP) : weeklyHiLoColor == "navy" ? color.new(color.navy,wlineTP) : weeklyHiLoColor == "olive" ? color.new(color.olive,wlineTP) : weeklyHiLoColor == "orange" ? color.new(color.orange,wlineTP) : weeklyHiLoColor == "purple" ? color.new(color.purple,wlineTP) : weeklyHiLoColor == "red" ? color.new(color.red,wlineTP) : weeklyHiLoColor == "silver" ? color.new(color.silver,wlineTP) : weeklyHiLoColor == "teal" ? color.new(color.teal,wlineTP) : weeklyHiLoColor == "white" ? color.new(color.white,wlineTP) : weeklyHiLoColor == "yellow" ? color.new(color.yellow,wlineTP) : color.new(color.black,wlineTP)
support_week_line_style = weeklyHiLoStyle == "solid" ? line.style_solid : weeklyHiLoStyle == "dashed" ? line.style_dashed : weeklyHiLoStyle == "dotted" ? line.style_dotted : line.style_solid



chart_time_period_int = timeframe.period == "1" ? 1 : timeframe.period == "3" ? 3 : timeframe.period == "5" ? 5 : timeframe.period == "15" ? 15 : timeframe.period == "30" ? 30 : timeframe.period == "45" ? 45 : 15
tickerExchangeOffset = 4

// Asian Session
int start_session_hour_int = 0
int end_session_hour_int = 0
int end_line_hour_int = 0

start_session_hour_int := user_ssth == "00" ? 0 : user_ssth == "01" ? 1 : user_ssth == "02" ? 2 : user_ssth == "03" ? 3 : user_ssth == "04" ? 4 : user_ssth == "05" ? 5 : user_ssth == "06" ? 6 : user_ssth == "07" ? 7 : user_ssth == "08" ? 8 : user_ssth == "09" ? 9 : user_ssth == "10" ? 10 : user_ssth == "11" ? 11 : user_ssth == "12" ? 12 : user_ssth == "13" ? 13 : user_ssth == "14" ? 14 : user_ssth == "15" ? 15 : user_ssth == "16" ? 16 : user_ssth == "17" ? 17 : user_ssth == "18" ? 18 : user_ssth == "19" ? 19 : user_ssth == "20" ? 20 : user_ssth == "21" ? 21 : user_ssth == "22" ? 22 : user_ssth == "23" ? 23 : 0
start_session_minute_int = user_sstm == "00" ? 0 : user_sstm == "15" ? 15 : user_sstm == "30" ? 30 : user_sstm == "45" ? 45 : 0

end_session_hour_int := user_esth == "00" ? 0 : user_esth == "01" ? 1 : user_esth == "02" ? 2 : user_esth == "03" ? 3 : user_esth == "04" ? 4 : user_esth == "05" ? 5 : user_esth == "06" ? 6 : user_esth == "07" ? 7 : user_esth == "08" ? 8 : user_esth == "09" ? 9 : user_esth == "10" ? 10 : user_esth == "11" ? 11 : user_esth == "12" ? 12 : user_esth == "13" ? 13 : user_esth == "14" ? 14 : user_esth == "15" ? 15 : user_esth == "16" ? 16 : user_esth == "17" ? 17 : user_esth == "18" ? 18 : user_esth == "19" ? 19 : user_esth == "20" ? 20 : user_esth == "21" ? 21 : user_esth == "22" ? 22 : user_esth == "23" ? 23 : 0
end_session_minute_int = user_estm == "00" ? 0 : user_estm == "15" ? 15 : user_estm == "30" ? 30 : user_estm == "45" ? 45 : 0

end_line_hour_int := user_elth == "00" ? 0 : user_elth == "01" ? 1 : user_elth == "02" ? 2 : user_elth == "03" ? 3 : user_elth == "04" ? 4 : user_elth == "05" ? 5 : user_elth == "06" ? 6 : user_elth == "07" ? 7 : user_elth == "08" ? 8 : user_elth == "09" ? 9 : user_elth == "10" ? 10 : user_elth == "11" ? 11 : user_elth == "12" ? 12 : user_elth == "13" ? 13 : user_elth == "14" ? 14 : user_elth == "15" ? 15 : user_elth == "16" ? 16 : user_elth == "17" ? 17 : user_elth == "18" ? 18 : user_elth == "19" ? 19 : user_elth == "20" ? 20 : user_elth == "21" ? 21 : user_elth == "22" ? 22 : user_elth == "23" ? 23 : 0
end_line_minute_int = user_eltm == "00" ? 0 : user_eltm == "15" ? 15 : user_eltm == "30" ? 30 : user_eltm == "45" ? 45 : 0

end_session_minute_int_offset = (end_session_minute_int + chart_time_period_int)

// End Section

// London Session
int london_start_session_hour_int = 0
int london_end_session_hour_int = 0

london_start_session_hour_int := london_ssth == "00" ? 0 : london_ssth == "01" ? 1 : london_ssth == "02" ? 2 : london_ssth == "03" ? 3 : london_ssth == "04" ? 4 : london_ssth == "05" ? 5 : london_ssth == "06" ? 6 : london_ssth == "07" ? 7 : london_ssth == "08" ? 8 : london_ssth == "09" ? 9 : london_ssth == "10" ? 10 : london_ssth == "11" ? 11 : london_ssth == "12" ? 12 : london_ssth == "13" ? 13 : london_ssth == "14" ? 14 : london_ssth == "15" ? 15 : london_ssth == "16" ? 16 : london_ssth == "17" ? 17 : london_ssth == "18" ? 18 : london_ssth == "19" ? 19 : london_ssth == "20" ? 20 : london_ssth == "21" ? 21 : london_ssth == "22" ? 22 : london_ssth == "23" ? 23 : 0
london_start_session_minute_int = london_sstm == "00" ? 0 : london_sstm == "15" ? 15 : london_sstm == "30" ? 30 : london_sstm == "45" ? 45 : 0

london_end_session_hour_int := london_esth == "00" ? 0 : london_esth == "01" ? 1 : london_esth == "02" ? 2 : london_esth == "03" ? 3 : london_esth == "04" ? 4 : london_esth == "05" ? 5 : london_esth == "06" ? 6 : london_esth == "07" ? 7 : london_esth == "08" ? 8 : london_esth == "09" ? 9 : london_esth == "10" ? 10 : london_esth == "11" ? 11 : london_esth == "12" ? 12 : london_esth == "13" ? 13 : london_esth == "14" ? 14 : london_esth == "15" ? 15 : london_esth == "16" ? 16 : london_esth == "17" ? 17 : london_esth == "18" ? 18 : london_esth == "19" ? 19 : london_esth == "20" ? 20 : london_esth == "21" ? 21 : london_esth == "22" ? 22 : london_esth == "23" ? 23 : 0
london_end_session_minute_int = london_estm == "00" ? 0 : london_estm == "15" ? 15 : london_estm == "30" ? 30 : london_estm == "45" ? 45 : 0


london_end_session_minute_int_offset = (london_end_session_minute_int + chart_time_period_int)

// End Section

// Check Chart Period to see if aspects should display
isValidResolution() => timeframe.isdwm == true or timeframe.period == "120" or timeframe.period == "240" or timeframe.period == "180" or timeframe.period == "360" ? 0 : 1
isBelowHourValidResolution() => timeframe.isdwm == true or timeframe.period == "120" or timeframe.period == "240" or timeframe.period == "180" or timeframe.period == "360" ? 0 : 1


// NY Session
int ny_start_session_hour_int = 0
int ny_end_session_hour_int = 0

ny_start_session_hour_int := ny_ssth == "00" ? 0 : ny_ssth == "01" ? 1 : ny_ssth == "02" ? 2 : ny_ssth == "03" ? 3 : ny_ssth == "04" ? 4 : ny_ssth == "05" ? 5 : ny_ssth == "06" ? 6 : ny_ssth == "07" ? 7 : ny_ssth == "08" ? 8 : ny_ssth == "09" ? 9 : ny_ssth == "10" ? 10 : ny_ssth == "11" ? 11 : ny_ssth == "12" ? 12 : ny_ssth == "13" ? 13 : ny_ssth == "14" ? 14 : ny_ssth == "15" ? 15 : ny_ssth == "16" ? 16 : ny_ssth == "17" ? 17 : ny_ssth == "18" ? 18 : ny_ssth == "19" ? 19 : ny_ssth == "20" ? 20 : ny_ssth == "21" ? 21 : ny_ssth == "22" ? 22 : ny_ssth == "23" ? 23 : 0
ny_start_session_minute_int = ny_sstm == "00" ? 0 : ny_sstm == "15" ? 15 : ny_sstm == "30" ? 30 : ny_sstm == "45" ? 45 : 0

ny_end_session_hour_int := ny_esth == "00" ? 0 : ny_esth == "01" ? 1 : ny_esth == "02" ? 2 : ny_esth == "03" ? 3 : ny_esth == "04" ? 4 : ny_esth == "05" ? 5 : ny_esth == "06" ? 6 : ny_esth == "07" ? 7 : ny_esth == "08" ? 8 : ny_esth == "09" ? 9 : ny_esth == "10" ? 10 : ny_esth == "11" ? 11 : ny_esth == "12" ? 12 : ny_esth == "13" ? 13 : ny_esth == "14" ? 14 : ny_esth == "15" ? 15 : ny_esth == "16" ? 16 : ny_esth == "17" ? 17 : ny_esth == "18" ? 18 : ny_esth == "19" ? 19 : ny_esth == "20" ? 20 : ny_esth == "21" ? 21 : ny_esth == "22" ? 22 : ny_esth == "23" ? 23 : 0
ny_end_session_minute_int = ny_estm == "00" ? 0 : ny_estm == "15" ? 15 : ny_estm == "30" ? 30 : ny_estm == "45" ? 45 : 0


ny_end_session_minute_int_offset = (ny_end_session_minute_int + chart_time_period_int)

// End Section


// Support Structures Time Details
start_support_hour_int = 17
start_support_minute_int = 0
end_support_hour_int = 17
end_support_minute_int = 0
// End Section

// Forex.com use a different server time that other brokers
// So need to adjust
if (syminfo.timezone == "Etc/UTC")
    start_session_hour_int := start_session_hour_int + tickerExchangeOffset
    end_session_hour_int := end_session_hour_int + tickerExchangeOffset
    end_line_hour_int := end_line_hour_int + tickerExchangeOffset
    
    london_start_session_hour_int := london_start_session_hour_int + tickerExchangeOffset
    london_end_session_hour_int := london_end_session_hour_int + tickerExchangeOffset

    ny_start_session_hour_int := ny_start_session_hour_int + tickerExchangeOffset
    ny_end_session_hour_int := ny_end_session_hour_int + tickerExchangeOffset
    
    start_support_hour_int := start_support_hour_int + tickerExchangeOffset
    end_support_hour_int := end_support_hour_int + tickerExchangeOffset

    // Asian Condition    
    // Need to check the adjusted time to make sure it is correct
    if (start_session_hour_int >= 24)
        if (start_session_hour_int == 24)
            user_ssth := "00"
        else
            user_ssth := "0" + tostring(start_session_hour_int - 24)
    else
        if (start_session_hour_int < 10)
            user_ssth := "0" + tostring(start_session_hour_int)
        else
            user_ssth := tostring(start_session_hour_int)
    

    if (end_session_hour_int >= 24)
        if (end_session_hour_int == 24)
            user_esth := "00"
        else
            user_esth := "0" + tostring(end_session_hour_int - 24)
    else
        if (end_session_hour_int < 10)
            user_esth := "0" + tostring(end_session_hour_int)
        else
            user_esth := tostring(end_session_hour_int)

    // End Condition

    // London Condition
    // Need to check the adjusted time to make sure it is correct
    if (london_start_session_hour_int >= 24)
        if (london_start_session_hour_int == 24)
            london_ssth := "00"
        else
            london_ssth := "0" + tostring(london_start_session_hour_int - 24)
    else
        if (london_start_session_hour_int < 10)
            london_ssth := "0" + tostring(london_start_session_hour_int)
        else
            london_ssth := tostring(london_start_session_hour_int)
    

    if (london_end_session_hour_int >= 24)
        if (london_end_session_hour_int == 24)
            london_esth := "00"
        else
            london_esth := "0" + tostring(london_end_session_hour_int - 24)
    else
        if (london_end_session_hour_int < 10)
            london_esth := "0" + tostring(london_end_session_hour_int)
        else
            london_esth := tostring(london_end_session_hour_int)

    // End Condition

    // New York Condition
    // Need to check the adjusted time to make sure it is correct
    if (ny_start_session_hour_int >= 24)
        if (ny_start_session_hour_int == 24)
            ny_ssth := "00"
        else
            ny_ssth := "0" + tostring(ny_start_session_hour_int - 24)
    else
        if (ny_start_session_hour_int < 10)
            ny_ssth := "0" + tostring(ny_start_session_hour_int)
        else
            ny_ssth := tostring(ny_start_session_hour_int)
    

    if (ny_end_session_hour_int >= 24)
        if (ny_end_session_hour_int == 24)
            ny_esth := "00"
        else
            ny_esth := "0" + tostring(ny_end_session_hour_int - 24)
    else
        if (ny_end_session_hour_int < 10)
            ny_esth := "0" + tostring(ny_end_session_hour_int)
        else
            ny_esth := tostring(ny_end_session_hour_int)

    // End Condition
    
// End Section

// this is the tradable session, from end of Asia to the end of NY 
trd_ses = (user_esth) + (user_estm) + "-" + (ny_esth) + (ny_estm)
//
rth_ses = ""
london_rth_ses = ""
ny_rth_ses = ""

rth_fill_ses = ""
london_rth_fill_ses = ""
ny_rth_fill_ses = ""

// RM changed the session details, rather than using offset to the user input minute
// So conditional logic is not required.
// Note - Not 100% sure why this complex logic was introduced. There could be knockon issues, so have retained existing logic remmed out.
// Actually looks like the extended logic is due to the back fill of the range
rth_ses := (user_ssth) + (user_sstm) + "-" + (user_esth) + user_estm
london_rth_ses := (london_ssth) + (london_sstm) + "-" + (london_esth) +  london_estm
ny_rth_ses := (ny_ssth) + (ny_sstm) + "-" + (ny_esth) + ny_estm

// Check the timeframe and the expected time and adjust appropiately
if (timeframe.period == "5" or timeframe.period == "3" or timeframe.period == "1") and end_session_minute_int == 0
    rth_fill_ses := (user_ssth) + (user_sstm) + "-" + (user_esth) + "0" + tostring(end_session_minute_int_offset)
else
    rth_fill_ses := (user_ssth) + (user_sstm) + "-" + (user_esth) + tostring(end_session_minute_int_offset)

if (timeframe.period == "5" or timeframe.period == "3" or timeframe.period == "1")  and london_end_session_minute_int == 0
    london_rth_fill_ses := (london_ssth) + (london_sstm) + "-" + (london_esth) +  "0" + tostring(london_end_session_minute_int_offset)
else
    london_rth_fill_ses := (london_ssth) + (london_sstm) + "-" + (london_esth) + tostring(london_end_session_minute_int_offset)


if (timeframe.period == "5" or timeframe.period == "3" or timeframe.period == "1")  and ny_end_session_minute_int == 0
    ny_rth_fill_ses := (ny_ssth) + (ny_sstm) + "-" + (ny_esth) + "0" + tostring(ny_end_session_minute_int_offset)
else
    ny_rth_fill_ses := (ny_ssth) + (ny_sstm) + "-" + (ny_esth) + tostring(ny_end_session_minute_int_offset)
 
// End Remove Logic Section

// End User Inputs

// General Functions
open_bar(ses) => 
    t = time("D", ses) 
    na(t[1]) and not na(t) or t[1] < t

is_open(ses) =>
    not na(time(timeframe.period, ses))


is_end_day() => 
    hour == 16 and minute == 45 ? true : false

is_new_day() => 
    syminfo.timezone == "Etc/UTC" and hour == 0 and minute == 0 ? true : syminfo.timezone != "Etc/UTC" and hour == 20 and minute == 0 ? true : false


get_label_offset(session) =>
    //o = 12//(barssince(not session[2]))
    //(o >= 12 and o <= 24) ? time[12] : time[24]
    (timeframe.period == "1") ? time[180] : (timeframe.period == "3") ? time[60] : (timeframe.period == "5") ? time[36] : (timeframe.period == "15") ? time[12] : (timeframe.period == "60") ? time[3] : time[12]

// With a new trading day starting at 5pm EST.
// When moving to new day need to check if the server
// still perceives is yesterday when the new trading day has started
is_new_day_switch_period() => 
    (hour >= 20 and minute == 0) and (hour <= 23 and minute <= 59) ? true: false


timerange(res, sess) => not na(time(res, sess)) ? 1 : 0
//


// Calculate ADR
adr(length) =>
    range = high - low
    sma(range[1], length)
to_pips(val) =>
    is_forex_pips ? round(val/syminfo.mintick/10) : round(val/syminfo.mintick)


day_adr = security(syminfo.tickerid, 'D', adr(daily_adr_length), lookahead=barmerge.lookahead_on)
one_day = 1000 * 60 * 60 * 24
// End ADR Calculation    


srcHi = high
srcLo = low

// Construct Asian Session Range
var hi = 10e-10
var lo = 10e10

startTimeDelta = 24 - start_session_hour_int + 1
endTimeDelta = 24 - start_session_hour_int + 1

startTimeAlignment() => (hour + startTimeDelta) > 24? 0 : 1


//
isStartTimeAlignment = startTimeAlignment()

endBoxTimeAlignment() => start_session_hour_int >= end_session_hour_int and (hour + startTimeDelta) > 24? 1 : start_session_hour_int >= end_session_hour_int and (hour + startTimeDelta) <= 24? 0 : start_session_hour_int < end_session_hour_int and (hour + startTimeDelta) > 24? 0 : -1
isEndBoxTimeAlignment = endBoxTimeAlignment()


endTimeAlignment() => start_session_hour_int >= end_session_hour_int and (hour + startTimeDelta) > 24? 1 : start_session_hour_int >= end_session_hour_int and (hour + startTimeDelta) <= 24? 0 : start_session_hour_int < end_session_hour_int and isEndBoxTimeAlignment == 0? 1 : start_session_hour_int < end_session_hour_int and (hour + endTimeDelta) > 24? -1 : 0
// Change above to support end of session being on the same day as the start on EST
//endTimeAlignment() => (hour) >= (start_session_hour_int) and isStartTimeAlignment == 0? 0 : 1

isEndTimeAlignment = endTimeAlignment()

FromDate = timestamp(year, month, dayofmonth - isStartTimeAlignment, start_session_hour_int, start_session_minute_int)
ToDate = timestamp(year, month, dayofmonth + isEndBoxTimeAlignment, end_session_hour_int, end_session_minute_int) - chart_time_period_int

LineFromDate = timestamp(year, month, dayofmonth + isEndBoxTimeAlignment, end_session_hour_int, end_session_minute_int) - chart_time_period_int
LineToDate = timestamp(year, month, dayofmonth + isEndTimeAlignment, end_line_hour_int, end_line_minute_int)

// When a new period begins, reset hi/lo.
hi := change(FromDate) ? srcHi : max(srcHi, hi)
lo := change(FromDate) ? srcLo : min(srcLo, lo)

inSession = not na(time(timeframe.period, rth_ses))

rth_open_bar = open_bar(rth_ses)
rth_is_open = is_open(rth_ses)
rth_low = float(na)
rth_low := rth_is_open ? rth_open_bar ? low : min(rth_low[1], low) : rth_low[1]
rth_high = float(na)
rth_high := rth_is_open ? rth_open_bar ? high : max(rth_high[1], high) : rth_high[1]
rth_mid = avg(rth_low, rth_high)

float range = na

// Build the Asian Box
trl = line.new(FromDate, rth_low, ToDate, rth_low, xloc=xloc.bar_time, color=line_color, style=box_line_style, width = boxLineWidth)
line.delete(trl[1])

trh = line.new(FromDate, rth_high, ToDate, rth_high, xloc=xloc.bar_time, color=line_color, style=box_line_style, width = boxLineWidth)
line.delete(trh[1])

trm = line.new(FromDate, rth_mid, ToDate, rth_mid, xloc=xloc.bar_time, color=midline_color, style=middle_line_style, width = sessionLineWidth)
line.delete(trm[1])

startBox = line.new(FromDate, rth_high, FromDate, rth_low, extend=extend.none, xloc=xloc.bar_time, color=line_color, style=box_line_style, width=boxLineWidth)
line.delete(startBox[1])

endBox = line.new(ToDate, rth_high, ToDate, rth_low, extend=extend.none, xloc=xloc.bar_time, color=line_color, style=box_line_style, width=boxLineWidth)
line.delete(endBox[1])
// End Section

//if not inSession and inSession[1]

//Apply the High / Low / Mid Session Lines for London / NY
tl = line.new(LineFromDate, rth_low, LineToDate, rth_low, xloc=xloc.bar_time, color=line_color, style=upperlower_line_style, width = sessionLineWidth)
line.delete(tl[1])

th = line.new(LineFromDate, rth_high, LineToDate, rth_high, xloc=xloc.bar_time, color=line_color, style=upperlower_line_style, width = sessionLineWidth)
line.delete(th[1])

tm = line.new(LineFromDate, rth_mid, LineToDate, rth_mid, xloc=xloc.bar_time, color=midline_color, style=middle_line_style, width = sessionLineWidth)
line.delete(tm[1])
// End Section


//Formula For Opening Range
highRes = rth_high
lowRes = rth_low

lineColor = color.new(color.white,100)
//timerange(res, sess) => not na(time(res, sess)) ? 1 : 0

//Plot Statements For Opening Range Lines
openRangeHigh = plot(timerange(timeframe.period, rth_fill_ses) > 0 and isBelowHourValidResolution() ? highRes : na, color=lineColor, style=plot.style_line, linewidth=0,  show_last=5, editable=false)
openRangeLow = plot(timerange(timeframe.period, rth_fill_ses) > 0 and isBelowHourValidResolution() ? lowRes : na, color=lineColor, style=plot.style_line, linewidth=0,  show_last=5, editable=false)
bgcolor(time(timeframe.period, rth_ses) > 0 and isBelowHourValidResolution() ? color.silver : na, transp=100, title="Asian Session Background Color")


fill(openRangeHigh, openRangeLow, color=isBelowHourValidResolution() ? color.blue : na, transp=90, title="Fill Asian Range Color")

if (not inSession and inSession[1] and isBelowHourValidResolution())
    range := ((rth_high[1]-rth_low[1])/(syminfo.mintick))/10
    labelTime = get_label_offset(inSession)

    if ((timeframe.isintraday or timeframe.isdaily) and showADR and (timenow - time) < (one_day * daily_adr))
        label mLabel = label.new(labelTime, rth_low[1], "A = " + tostring(range) + "\nADR = " + tostring(to_pips(day_adr)), xloc.bar_time, yloc.price, color.new(color.black,100), label.style_labelup, text_color, labelsize)
    else
        label mLabel = label.new(labelTime, rth_low[1], "A = " + tostring(range), xloc.bar_time, yloc.price, color.new(color.black,100), label.style_labelup, text_color, labelsize)

// End Sesction

// Construct London Session Range
var london_hi = 10e-10
var london_lo = 10e10

londonStartTimeDelta = 24 - london_start_session_hour_int + 1
londonEndTimeDelta = 24 - london_end_session_hour_int + 1

startLondonTimeAlignment() => (hour + londonStartTimeDelta) > 24? 0 : 1
isLondonStartTimeAlignment = startLondonTimeAlignment()

// These function deal with the shift of the box from one day to the next
// At the moment they appear a little early. But wonder whether that is a 
// Nice feature to show the user that the session is about to start

endLondonTimeAlignment() => (hour) >= (london_start_session_hour_int) and isLondonStartTimeAlignment == 0? 0 : 1
// Cause issue with displaying - works better with the above statement
//endLondonTimeAlignment() => (hour) >= (london_start_session_hour_int) and (minute) >= (london_start_session_minute_int - chart_time_period_int) and isLondonStartTimeAlignment == 0? 0 : 1
isLondonEndTimeAlignment = endLondonTimeAlignment()

float london_range = na

LondonFromDate = timestamp(year, month, dayofmonth - isLondonStartTimeAlignment, london_start_session_hour_int, london_start_session_minute_int)
LondonToDate = timestamp(year, month, dayofmonth - isLondonEndTimeAlignment, london_end_session_hour_int, london_end_session_minute_int) - chart_time_period_int


// When a new period begins, reset hi/lo.
london_hi := change(LondonFromDate) ? srcHi : max(srcHi, london_hi)
london_lo := change(LondonFromDate) ? srcLo : min(srcLo, london_lo)

inLondonSession = not na(time(timeframe.period, london_rth_ses))

london_rth_open_bar = open_bar(london_rth_ses)
london_rth_is_open = is_open(london_rth_ses)
london_rth_low = float(na)
london_rth_low := london_rth_is_open ? london_rth_open_bar ? low : min(london_rth_low[1], low) : london_rth_low[1]
london_rth_high = float(na)
london_rth_high := london_rth_is_open ? london_rth_open_bar ? high : max(london_rth_high[1], high) : london_rth_high[1]
london_rth_mid = avg(london_rth_low, london_rth_high)

if (show_london_session and isValidResolution())
    
    //if inSession
    // Build the Asian Box
    ltrl = line.new(LondonFromDate, london_rth_low, LondonToDate, london_rth_low, xloc=xloc.bar_time, color=lline_color, style=lbox_line_style, width = lboxLineWidth)
    line.delete(ltrl[1])
    
    ltrh = line.new(LondonFromDate, london_rth_high, LondonToDate, london_rth_high, xloc=xloc.bar_time, color=lline_color, style=lbox_line_style, width = lboxLineWidth)
    line.delete(ltrh[1])
    
    ltrm = line.new(LondonFromDate, london_rth_mid, LondonToDate, london_rth_mid, xloc=xloc.bar_time, color=lmidline_color, style=lmiddle_line_style, width = lsessionLineWidth)
    line.delete(ltrm[1])
    
    londonStartBox = line.new(LondonFromDate, london_rth_high, LondonFromDate, london_rth_low, extend=extend.none, xloc=xloc.bar_time, color=lline_color, style=lbox_line_style, width=lboxLineWidth)
    line.delete(londonStartBox[1])
    
    londonEndBox = line.new(LondonToDate, london_rth_high, LondonToDate, london_rth_low, extend=extend.none, xloc=xloc.bar_time, color=lline_color, style=lbox_line_style, width=lboxLineWidth)
    line.delete(londonEndBox[1])
    // End Section
    
    //if not inSession and inSession[1]
    
    //Apply the High / Low / Mid Session Lines for London / NY
    //tl = line.new(LineFromDate, rth_low, LineToDate, rth_low, xloc=xloc.bar_time, color=line_color, style=upperlower_line_style, width = sessionLineWidth)
    //line.delete(tl[1])
    
    //th = line.new(LineFromDate, rth_high, LineToDate, rth_high, xloc=xloc.bar_time, color=line_color, style=upperlower_line_style, width = sessionLineWidth)
    //line.delete(th[1])
    
    //tm = line.new(LineFromDate, rth_mid, LineToDate, rth_mid, xloc=xloc.bar_time, color=midline_color, style=middle_line_style, width = sessionLineWidth)
    //line.delete(tm[1])
    // End Section
    
    // End Condition
    
//Formula For Opening Range
londonHighRes = london_rth_high
londonLowRes = london_rth_low

LondonLineColor = color.new(color.white,100)

//Plot Statements For Opening Range Lines
londonOpenRangeHigh = plot(timerange(timeframe.period, london_rth_fill_ses) > 0 and show_london_session and isBelowHourValidResolution() ? londonHighRes : na, color=LondonLineColor, style=plot.style_line, linewidth=0,  show_last=5, editable=false)
londonOpenRangeLow = plot(timerange(timeframe.period, london_rth_fill_ses) > 0 and show_london_session and isBelowHourValidResolution() ? londonLowRes : na, color=LondonLineColor, style=plot.style_line, linewidth=0,  show_last=5, editable=false)
bgcolor(time(timeframe.period, london_rth_fill_ses) > 0 and show_london_session and isBelowHourValidResolution() ? color.silver : na, transp=100, title="London Session Background Color")
fill(londonOpenRangeHigh, londonOpenRangeLow, color=show_london_session and isBelowHourValidResolution() ? color.teal : na, transp=90, title="Fill London Range Color")

if show_london_session_rng and not inLondonSession and inLondonSession[1] and isBelowHourValidResolution()
    london_range := ((london_rth_high[1]-london_rth_low[1])/(syminfo.mintick))/10
    londonLabelTime = get_label_offset(inLondonSession)

    label mLondonLabel = label.new(londonLabelTime, london_rth_low[1], "L = " + tostring(london_range), xloc.bar_time, yloc.price, color.new(color.black,100), label.style_labelup, ltext_color, llabelsize)

// End Sesction


// Construct New York Session Range
var ny_hi = 10e-10
var ny_lo = 10e10

nyStartTimeDelta = 24 - ny_start_session_hour_int + 1
nyEndTimeDelta = 24 - ny_end_session_hour_int + 1

startNyTimeAlignment() => (hour + nyStartTimeDelta) > 24? 0 : 1
isNyStartTimeAlignment = startNyTimeAlignment()


endNyTimeAlignment() => (hour) >= (ny_start_session_hour_int)  and isNyStartTimeAlignment == 0? 0 : 1
//endNyTimeAlignment() => (hour) >= (ny_start_session_hour_int) and (minute) >= (ny_start_session_minute_int - chart_time_period_int) and isNyStartTimeAlignment == 0? 0 : 1
isNyEndTimeAlignment = endNyTimeAlignment()


float ny_range = na

NyFromDate = timestamp(year, month, dayofmonth - isNyStartTimeAlignment, ny_start_session_hour_int, ny_start_session_minute_int)
NyToDate = timestamp(year, month, dayofmonth - isNyEndTimeAlignment, ny_end_session_hour_int, ny_end_session_minute_int) - chart_time_period_int


// When a new period begins, reset hi/lo.
ny_hi := change(NyFromDate) ? srcHi : max(srcHi, ny_hi)
ny_lo := change(NyFromDate) ? srcLo : min(srcLo, ny_lo)

inNySession = not na(time(timeframe.period, ny_rth_ses))

ny_rth_open_bar = open_bar(ny_rth_ses)
ny_rth_is_open = is_open(ny_rth_ses)
ny_rth_low = float(na)
ny_rth_low := ny_rth_is_open ? ny_rth_open_bar ? low : min(ny_rth_low[1], low) : ny_rth_low[1]
ny_rth_high = float(na)
ny_rth_high := ny_rth_is_open ? ny_rth_open_bar ? high : max(ny_rth_high[1], high) : ny_rth_high[1]
ny_rth_mid = avg(ny_rth_low, ny_rth_high)

if (show_ny_session and isValidResolution())
    
    //if inSession
    // Build the Asian Box
    ntrl = line.new(NyFromDate, ny_rth_low, NyToDate, ny_rth_low, xloc=xloc.bar_time, color=nline_color, style=nbox_line_style, width = nboxLineWidth)
    line.delete(ntrl[1])
    
    ntrh = line.new(NyFromDate, ny_rth_high, NyToDate, ny_rth_high, xloc=xloc.bar_time, color=nline_color, style=nbox_line_style, width = nboxLineWidth)
    line.delete(ntrh[1])
    
    ntrm = line.new(NyFromDate, ny_rth_mid, NyToDate, ny_rth_mid, xloc=xloc.bar_time, color=nmidline_color, style=nmiddle_line_style, width = nsessionLineWidth)
    line.delete(ntrm[1])
    
    nyStartBox = line.new(NyFromDate, ny_rth_high, NyFromDate, ny_rth_low, extend=extend.none, xloc=xloc.bar_time, color=nline_color, style=nbox_line_style, width=nboxLineWidth)
    line.delete(nyStartBox[1])
    
    nyEndBox = line.new(NyToDate, ny_rth_high, NyToDate, ny_rth_low, extend=extend.none, xloc=xloc.bar_time, color=nline_color, style=nbox_line_style, width=nboxLineWidth)
    line.delete(nyEndBox[1])
    // End Section
    
    //if not inSession and inSession[1]
    
    //Apply the High / Low / Mid Session Lines for London / NY
    //tl = line.new(LineFromDate, rth_low, LineToDate, rth_low, xloc=xloc.bar_time, color=line_color, style=upperlower_line_style, width = sessionLineWidth)
    //line.delete(tl[1])
    
    //th = line.new(LineFromDate, rth_high, LineToDate, rth_high, xloc=xloc.bar_time, color=line_color, style=upperlower_line_style, width = sessionLineWidth)
    //line.delete(th[1])
    
    //tm = line.new(LineFromDate, rth_mid, LineToDate, rth_mid, xloc=xloc.bar_time, color=midline_color, style=middle_line_style, width = sessionLineWidth)
    //line.delete(tm[1])
    // End Section
    
    // End Condition
    
//Formula For Opening Range
nyHighRes = ny_rth_high
nyLowRes = ny_rth_low

NyLineColor = color.new(color.white,100)

//Plot Statements For Opening Range Lines
nyOpenRangeHigh = plot(timerange(timeframe.period, ny_rth_fill_ses) > 0 and show_ny_session and isBelowHourValidResolution() ? nyHighRes : na, color=NyLineColor, style=plot.style_line, linewidth=0,  show_last=5, editable=false)
nyOpenRangeLow = plot(timerange(timeframe.period, ny_rth_fill_ses) > 0 and show_ny_session and isBelowHourValidResolution() ? nyLowRes : na, color=NyLineColor, style=plot.style_line, linewidth=0,  show_last=5, editable=false)
bgcolor(time(timeframe.period, ny_rth_fill_ses) > 0 and show_ny_session and isBelowHourValidResolution() ? color.silver : na, transp=100, title="New York Session Background Color")
fill(nyOpenRangeHigh, nyOpenRangeLow, color=show_ny_session and isBelowHourValidResolution() ? color.silver : na, transp=90, title="Fill New York Range Color")

if show_ny_session_rng and not inNySession and inNySession[1] and isBelowHourValidResolution()
    ny_range := ((ny_rth_high[1]-ny_rth_low[1])/(syminfo.mintick))/10
    nyLabelTime = get_label_offset(inNySession)

    label mNyLabel = label.new(nyLabelTime, ny_rth_low[1], "N = " + tostring(ny_range), xloc.bar_time, yloc.price, color.new(color.black,100), label.style_labelup, ntext_color, nlabelsize)

// End Sesction



getData(r, s) => security(syminfo.tickerid, r, s, barmerge.gaps_off, barmerge.lookahead_on) 

pdh = getData('D', high[1])
pdl = getData('D', low[1])

wh = getData('1W', high[0])
wl = getData('1W', low[0])

lwh = getData('1W', high[1])
lwl = getData('1W', low[1])

float pdh_label_price = na
float pdl_label_price = na
int checkSwitch = 1

if (is_new_day_switch_period())
    pdh_label_price := getData('D', high[1])
    pdl_label_price := getData('D', low[1])
    checkSwitch = 0
else
    pdh_label_price := getData('D', high[0])
    pdl_label_price := getData('D', low[0])
    checkSwitch = 1
    


supportStartTimeDelta = 24 - start_session_hour_int + 1
supportEndTimeDelta = 24 - start_session_hour_int + 1

supportStartTimeAlignment() => (hour + supportStartTimeDelta) > 24? 0 : 1
isSupportStartTimeAlignment = supportStartTimeAlignment()

supportEndTimeAlignment() => (hour + supportEndTimeDelta) > 24? 1 : 0
isSupportEndTimeAlignment = supportEndTimeAlignment()



//SupportFromStartWeekDate = timestamp(startWeekYear, startWeekMonth, startWeekDayofMonth - isSupportStartTimeAlignment, start_support_hour_int, start_support_minute_int)
SupportFromStartWeekDate = timestamp(year, month, dayofmonth - isSupportStartTimeAlignment, start_support_hour_int, start_support_minute_int)
SupportFromDate = timestamp(year, month, dayofmonth - isSupportStartTimeAlignment, start_support_hour_int, start_support_minute_int)
SupportToDate = timestamp(year, month, dayofmonth + isSupportEndTimeAlignment, end_support_hour_int, end_support_minute_int) - chart_time_period_int

if (showPreviousDayHiLo and isBelowHourValidResolution())


    
    // Build the Previous support line Box
    yesterdayHighLine = line.new(SupportFromDate, pdh, SupportToDate, pdh, xloc=xloc.bar_time, extend=extend.none, color=support_line_color, style=support_line_style, width = supportLineWidth)
    line.delete(yesterdayHighLine[1])

    yesterdayLowLine = line.new(SupportFromDate, pdl, SupportToDate, pdl, xloc=xloc.bar_time, extend=extend.none, color=support_line_color, style=support_line_style, width = supportLineWidth)
    line.delete(yesterdayLowLine[1])


    pdCheckIsNewDay = is_new_day()
    // Show the label
    if (showHiLoPriceRange and pdCheckIsNewDay)

        if (showHiLoPriceLabel)
            // Add Previous Day High
            label pdHi_label = label.new(time - (time-time[1])*15, pdh_label_price, "YH (" + tostring(((pdh_label_price-pdl_label_price)/(syminfo.mintick))/10) + ")", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_line_label_color, nlabelsize)
            label.delete(pdHi_label[1])
    
            // Add Previous Day Low
            label pdLow_label = label.new(time - (time-time[1])*14, pdl_label_price, "YL", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_line_label_color, nlabelsize)
            label.delete(pdLow_label[1])
        else
            // Add Previous Day High
            label pdHi_label = label.new(time - (time-time[1])*15, pdh_label_price, tostring(((pdh_label_price-pdl_label_price)/(syminfo.mintick))/10), xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_line_label_color, nlabelsize)
            label.delete(pdHi_label[1])
    


    if (showHiLoPriceLabel and not showHiLoPriceRange and pdCheckIsNewDay)
    
        // Add Previous Day High
        label pdHi_label = label.new(time - (time-time[1])*14, pdh_label_price, "YH", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_line_label_color, nlabelsize)
        label.delete(pdHi_label[1])

        // Add Previous Day Low
        label pdLow_label = label.new(time - (time-time[1])*14, pdl_label_price, "YL", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_line_label_color, nlabelsize)
        label.delete(pdLow_label[1])
    
if (showWeeklyHiLo and isBelowHourValidResolution()) 

    // Build the week high lo support line Box
    weekHighLine = line.new(SupportFromStartWeekDate, wh, SupportToDate, wh, xloc=xloc.bar_time, extend=extend.none, color=support_week_line_color, style=support_line_style, width = supportLineWidth)
    line.delete(weekHighLine[1])

    weekLowLine = line.new(SupportFromStartWeekDate, wl, SupportToDate, wl, xloc=xloc.bar_time, extend=extend.none, color=support_week_line_color, style=support_line_style, width = supportLineWidth)
    line.delete(weekLowLine[1])

    // Show the label
    if (weeklyHiLoShowLabel and is_new_day())

        // Add Week High
        label wkHi_label = label.new(time - (time-time[1])*14, wh, "WH", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_week_line_color, nlabelsize)
        label.delete(wkHi_label[1])

        // Add Week Low
        label wkLow_label = label.new(time - (time-time[1])*14, wl, "WL", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_week_line_color, nlabelsize)
        label.delete(wkLow_label[1])

if (showLastWeeklyHiLo and isBelowHourValidResolution()) 

    // Build the week high lo support line Box
    weekLastHighLine = line.new(SupportFromStartWeekDate, lwh, SupportToDate, lwh, xloc=xloc.bar_time, extend=extend.none, color=support_last_week_line_color, style=support_last_week_line_style, width = supportLastWeekLineWidth)
    line.delete(weekLastHighLine[1])

    weekLastLowLine = line.new(SupportFromStartWeekDate, lwl, SupportToDate, lwl, xloc=xloc.bar_time, extend=extend.none, color=support_last_week_line_color, style=support_last_week_line_style, width = supportLastWeekLineWidth)
    line.delete(weekLastLowLine[1])

    // Show the label
    if (lastWeeklyHiLoShowLabel and is_new_day())

        // Add Week High
        label lwkHi_label = label.new(time - (time-time[1])*14, lwh, "PWH", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_last_week_line_label_color, nlabelsize)
        label.delete(lwkHi_label[1])

        // Add Week Low
        //label wkLow_label = label.new(x=bar_index[4], y=lwl, text="PWL", color=color.new(color.black,100), style=label.style_none, textcolor=support_last_week_line_label_color, size=nlabelsize)
        label lwkLow_label = label.new(time - (time-time[1])*14, lwl, "PWL", xloc.bar_time, yloc.price, color.new(color.black,100), label.style_none, support_last_week_line_label_color, nlabelsize)
        label.delete(lwkLow_label[1])

// Show Hi / Low of Day Time

    
//f_print(_txt) => var _lbl = label(na), label.delete(_lbl), _lbl := label.new(time + (time-time[1])*3, high, _txt, xloc.bar_time, yloc.price, size = size.large)

endOfDay = is_end_day()
//rsi = rsi(close, 7)
//hb = highestbars(rsi, 20)


var highOfDayHour = 10e-10
var highOfDayMinute = 10e-10
var lowOfDayHour = 10e-10
var lowOfDayMinute = 10e-10

lookbackLength = 95


hb = highestbars(lookbackLength)
highBarIndex = -hb

highBarTime = time[highBarIndex]
highBarHour = hour[highBarIndex]
highBarMinute = minute[highBarIndex]


lb = lowestbars(lookbackLength)
lowBarIndex = -lb

lowBarTime = time[lowBarIndex]
lowBarHour = hour[lowBarIndex]
lowBarMinute = minute[lowBarIndex]


if (showHiLoTime and isValidResolution() and endOfDay)
    
    highOfDayHour = highBarHour
    lowOfDayHour = lowBarHour

    label.new(bar_index[10], high[highBarIndex], "HOD: " + tostring(highOfDayHour) + ":" + tostring(highBarMinute), style=label.style_none, textcolor=color.silver)
    label.new(bar_index[10], low[lowBarIndex], "LOD: " + tostring(lowOfDayHour) + ":" + tostring(lowBarMinute), style=label.style_none, textcolor=color.silver)

    hourIndexNullHour = valuewhen(not na(highOfDayHour), highOfDayHour, 0)    


// Check whether an alert needs to be fired

// Alert for whether prices has closed outside the range

inTradableSession = not na(time(timeframe.period, trd_ses))

isCloseBelow = false
isCloseAbove = false

//if (not inSession and inSession[1] and isBelowHourValidResolution())
if (inTradableSession and close[1] >= rth_low and close < rth_low)
    isCloseBelow := true
    
if (inTradableSession and close[1] <= rth_high and close > rth_high)
    isCloseAbove := true


alertcondition((isCloseBelow or isCloseAbove), title='Asian Range Break', message='Price has closed outside the Asian Session Range.')

// Debugger Section
//
f_print(_txt) => var _lbl = label(na), label.delete(_lbl), _lbl := label.new(time + (time-time[1])*3, high, _txt, xloc.bar_time, yloc.price, size = size.large)
//
//if (not inSession and inSession[1])
//if (not inSession and (inLondonSession or inNySession))
//    f_print(tostring(rth_high) + "\n" + tostring(rth_low))
//if (isCloseBelow or isCloseAbove)
//    f_print("Break Occured=" + trd_ses)

//f_print("ny_rth_fill_ses = " + ny_rth_fill_ses + "\nlondon_rth_ses=" + london_rth_ses + "\nny_rth_ses=" + ny_rth_ses + "\nisLondonEndTimeAlignment=" + tostring(isLondonEndTimeAlignment) + "\nlondon_start_session_minute_int=" + tostring(london_start_session_minute_int)) 
//f_print("isEndTimeAlignment = " + tostring(isEndTimeAlignment) + " " + " isEndBoxTimeAlignment=" + tostring(isEndBoxTimeAlignment)) 
//f_print("from Date = " + tostring(dayofmonth - 1 - isSupportStartTimeAlignment) + "\npd_rth_low = " + tostring(pd_rth_low) + "\nstart_support_hour_int = " + tostring(start_support_hour_int) + "\nhigh_range = " + tostring(high_range) + "\nlow_range=" + tostring(low_range)) 
//f_print("rth_ses = " + (rth_ses) + "\nTimezone = " + syminfo.timezone + "\nisLondonEndTimeAlignment = " + tostring(isLondonEndTimeAlignment) + "\nlondon_end_session_hour_int = " + tostring(london_end_session_hour_int) + "\nisStartTimeAlignment = " + tostring(isStartTimeAlignment)) 
//f_print("Bars since=" + tostring(round(barssince(not inSession[2]))) + " sess=")