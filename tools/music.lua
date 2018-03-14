

function drawdata(y, v, b1, b2)
	b1	= b1 - 1
	b2	= b2 - 1
	local yp	= (y + 1) * 8
	local bp	= 50
	local bs	= 3
	gui.text(2, yp, string.format("%02X %02X %02X", v, b1, b2))
	for i = 0, b2 - 1 do
		local c = i < b1 and trackptc[y] or "black"
		gui.box(bp + i * bs, yp + 1, bp + i * bs + bs, yp + 5, c, "gray")
	end

end

local m = memory.readbyte
local trackptl	= {}
local trackpth	= {}
local oldmp		= 0
trackptc		= {"red", "green", "cyan", "blue"}

while true do
	gui.box(0, 0, 255, 255, "#0000003F", "#0000003F")
	mp	= m(0x00bc) * 0x100 + m(0x00bb)
	gui.text(1, 1, string.format("%04X", mp))

	if oldmp ~= mp then
		for i = 0, 3 do
			trackptl[i]	= m(0x0613 + i)
			trackpth[i]	= trackptl[i]
		end
		oldmp	= mp
	end
	for i = 0, 3 do
		trackpth[i]	= math.max(trackpth[i], m(0x0613 + i))
	end
	gui.box(0, 74, 255, 120, "black", "black")
	for i = 0, 3 do
		gui.box(trackptl[i], 80 + i * 8 + 2, trackpth[i], 80 + i * 8 + 5, trackptc[i + 1], trackptc[i + 1])
		gui.line(m(0x0613 + i), 80 + i * 8, m(0x0613 + i), 80 + i * 8 + 7, white)
	end

	drawdata(1, m(0x0613), m(0x0618), m(0x0617))
	drawdata(2, m(0x0614), m(0x061a), m(0x05ed))
	drawdata(3, m(0x0615), m(0x061d), m(0x061c))
	drawdata(4, m(0x0616), m(0x061e), m(0x061f))
	--drawdata(4, m(0x0613), m(0x0614), m(0x0615))
	emu.frameadvance()
end
