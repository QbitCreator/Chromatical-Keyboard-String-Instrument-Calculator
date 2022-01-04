short_octave=0
lowest_c_freq=0.0
range=0
string_dia=0
string_density=0.0
string_tension=0.0
string_length=0.0
note_names=["C","Cis","D","Dis","E","F","Fis","G","Gis","A","B","H"]
octave=0
octave_note=0
current_freq=0.0
note=0.0
total_wire_length=0
string_count=0

puts("\n\nWillkommen zum Saitenrechner von Leif-Erik Hallmann (2020)")
puts("\n______________________________________________________________________\n")
puts("\nDieser Rechner kann die Saitenlängen für Tasteninstrumente mit einem einzelnen Saitentyp berechnen.")
puts("\nBeantworten sie einfach die Fragen und die Ergebnisse werden als Tabelle ausgegeben.")
puts("\nSoll das Instrument eine kurze Oktave haben?(1/0)")
short_octave=gets().to_i
puts("\nWelche Frequenz(in Hz) soll das tiefste C haben?")
lowest_c_freq=gets().chop.to_f
puts("\nWie viele Oktaven soll das Instrument haben?")
range=(12*gets().to_f)+1
puts("\nWelchen Durchmesser(in mm) haben die verwendeten Saiten?")
string_dia=gets().to_f/1000
puts("\nWelche Dichte(in g/cm³) hat das Saitenmaterial?")
string_density=gets().chop.to_f*1000
puts("\nWie stark(in kg) sollen die Saiten jeweils gespannt sein?")
string_tension=(gets().chop.to_f)*10
puts("\nHier sind die Ergebnisse:")

for x in 0..range-1 do
	
	#Errechnen der Frequenzen und Saitenlängen
	current_freq=(lowest_c_freq*2.0**(note/12.0)).to_i
	string_length=((Math.sqrt(string_tension/((current_freq.to_f**2)*Math::PI*string_density*(string_dia**2))))*1000).to_i	
	
	#Ausgabe für alle Töne des angegebenen Intervalls
	if short_octave==0 then
		puts((string_count+1).to_s+" "+note_names[octave_note]+octave.to_s+", "+current_freq.to_s+"Hz, "+string_length.to_s+"mm")
		total_wire_length=total_wire_length.to_f+string_length
		string_count=string_count+1
	end
	
	#Ausgabe für Instrument mit kurzer Oktave
	if short_octave==1 && note!=1 && note!=3 && note!=6 && note!=8 then
		puts((string_count+1).to_s+" "+note_names[octave_note]+octave.to_s+", "+current_freq.to_s+"Hz, "+string_length.to_s+"mm")
		total_wire_length=total_wire_length.to_f+string_length
		string_count=string_count+1	
	end
	
	octave_note=octave_note+1
	if octave_note==12 then
		octave_note=0
		octave=octave+1
	end	
	note=note+1
end

total_wire_length=total_wire_length.to_f/1000
puts("\n__________________________________________________________________________________\n")
puts("Es werden insgesamt "+total_wire_length.to_s+"m Saitenmaterial(z.B. Draht) benötigt.")
