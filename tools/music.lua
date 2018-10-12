

function drawdata(y, v, b1, b2, b3)
	b1	= b1 - 1
	b2	= b2 - 1
	local yp	= (y + 1) * 8
	local bp	= 50
	local bs	= 3
	gui.text(2, yp, string.format("%02X %02X %02X", v, b1, b2))
	gui.text(2, yp + 140, string.format("%04X", b3))
	for i = 0, b2 - 1 do
		local c = i < b1 and trackptc[y] or "#222222"
		gui.box(bp + i * bs, yp + 1, bp + i * bs + bs, yp + 5, c, "black")
	end

end

local m = memory.readbyte
local trackptl	= {}
local trackpth	= {}
local oldmp		= 0

local musAddr	= {}
musAddr[0]	= { 0x0613, 0x0618, 0x0617 }
musAddr[1]	= { 0x0614, 0x061a, 0x05ed }
musAddr[2]	= { 0x0615, 0x061d, 0x061c }
musAddr[3]	= { 0x0616, 0x061e, 0x061f }
musAddr[4]	= { 0x05ff, 0x05fa, 0x05fb }


trackptc		= {"red", "green", "cyan", "blue", "yellow"}

while true do
	gui.box(0, 0, 255, 255, "#0000003F", "#0000003F")
	mp	= m(0x00bc) * 0x100 + m(0x00bb)
	gui.text(1, 1, string.format("%04X", mp))

	if oldmp ~= mp then
		for i = 0, 4 do
			trackptl[i]	= m(musAddr[i][1])
			trackpth[i]	= trackptl[i]
		end
		oldmp	= mp
	end
	for i = 0, 4 do
		trackpth[i]	= math.max(trackpth[i], m(musAddr[i][1]))
	end
	gui.box(0, 74, 255, 120, "black", "black")
	for i = 0, 4 do
		gui.box(trackptl[i], 80 + i * 8 + 2, trackpth[i], 80 + i * 8 + 5, trackptc[i + 1], trackptc[i + 1])
		gui.line(m(musAddr[i][1]), 80 + i * 8, m(musAddr[i][1]), 80 + i * 8 + 7, white)
	end

	drawdata(1, m(musAddr[0][1]), m(musAddr[0][2]), m(musAddr[0][3]), mp + trackptl[0])
	drawdata(2, m(musAddr[1][1]), m(musAddr[1][2]), m(musAddr[1][3]), mp + trackptl[1])
	drawdata(3, m(musAddr[2][1]), m(musAddr[2][2]), m(musAddr[2][3]), mp + trackptl[2])
	drawdata(4, m(musAddr[3][1]), m(musAddr[3][2]), m(musAddr[3][3]), mp + trackptl[3])
	drawdata(5, m(musAddr[4][1]), m(musAddr[4][2]), m(musAddr[4][3]), mp + trackptl[4])
	--drawdata(4, m(0x0613), m(0x0614), m(0x0615))
	emu.frameadvance()
end
