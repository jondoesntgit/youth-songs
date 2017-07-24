#!/usr/bin/env ruby

foo = String.new

if !foo.empty?
	print "Foo!"
end

lyrics = <<END

>Chorus

V1

V2

>Chorus2
you
go

V3

END

chorus = String.new
lastPrinted = String.new

sections = lyrics.split(/\n{2,}/)
sections.map! {|section| section.strip}

output = Array.new

for section in sections
	case section[0]
	when ">"
		type = :chorus
		content = section.slice(1..-1)
		chorus = content
	else
		type = :verse
		content = section
	end

	case lastPrinted
	when :chorus
		output << content
		lastPrinted = type
	when :verse
		output << chorus if type == :verse and chorus
		output << content
		lastPrinted = type
	else
		output << content
		lastPrinted = type
	end
end

if lastPrinted == :verse
	output << chorus
end

print output

#content =  lyrics.gsub(/\n/, "<br/>") 
#content =  content.gsub(/(<br\/>){2,}/,"</section>\n\n<section>") 
#puts "<section>" + content + "</section>" 