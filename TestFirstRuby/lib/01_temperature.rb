def ftoc (temp_f)
	temp_c = ((temp_f - 32.0) * (5.0/9.0))
	temp_c
end

def ctof (temp_c)
	temp_f = (temp_c * (9.0/5.0) + 32.0)
	temp_f
end