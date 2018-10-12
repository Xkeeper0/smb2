
local arrays = {
	0x9F,
	0xB1,
	--0xD9,
	0x42F,
	0x438,
	0x44A,
	0x453,
	0x45C,
	0x46E,
	0x477,
	0x480,
	0x489,
	0x492,
	0x4CC,
	0x4D6,
	}


while true do

	for i = 0, 8 do
		local ostr		= string.format("%X", i)
		for k,v in ipairs(arrays) do
			ostr	= ostr .. string.format(".%2X", memory.readbyte(v + i))
		end
		local estate = memory.readbyte(0x51 + i)
		local ecolor = estate >= 1 and "white" or "gray"
		gui.text(0, i * 8, ostr, ecolor)
	end

	emu.frameadvance()
end
