script_name = "Join Consecutive Lines"
script_description = "Joins consecutive subtitle lines"
script_author = "ChatGPT"
script_version = "1.0"

function join_lines(subs, sel)
    for i = #subs - 1, 1, -1 do
        local line1 = subs[i]
        local line2 = subs[i + 1]
        if line1.class == "dialogue" and line2.class == "dialogue" then
            if line1.end_time == line2.start_time then
                line1.text = line1.text .. " " .. line2.text
                line1.end_time = line2.end_time
                subs[i] = line1
                subs.delete(i + 1)
            end
        end
    end
end

aegisub.register_macro("Join Immediate Subtitle Lines", "Joins immediate (back-to-back) subtitles", join_lines)
