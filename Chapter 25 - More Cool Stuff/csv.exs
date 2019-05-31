defmodule CsvSigil do

	def sigil_v(lines, _opts) do
		lines 
		|> String.trim 
		|> String.split("\n")
		|> Enum.map(&String.split(&1, ","))
		|> Enum.map(&toFloat(&1))
	end

	def testFloat(list) do
		toFloat(list)
	end

	defp toFloat(list) when is_list(list) do
		Enum.map(list, &toFloat(&1))
	end

	defp toFloat(str) do
		str
		|> String.trim
		|> Float.parse
		|> case do
			:error -> str
			{v, _} -> v
		end
	end

end

defmodule Test do
	
	# Exercise: MoreCoolStuff-1

	# Write a sigil ~v that parses multiple lines of comma-separated data,
	# returning a list of where each element is a row of data and each row
	# is a list of values. Don't worry about quoting - just assume each 
	# field is separated by a comma.

	# Exercise: MoreCoolStuff-2

	# The function Float.parse converts leading characters of a string to a float,
	# returning either a tuple containing the value and the rest of the string,
	# or the atom :error.

	# Exercise: MoreCoolStuff-3

	# (Hard) Sometimes the first line of a CSV file is a list of the column names.
	# Update your code to support this, and return the values in each row as a
	# keyword list, using the column names as the keys.

	import CsvSigil

	def csv do
		~v"""
		1,2,3,3.14
		cat,dog
		"""
	end

	def toFloat do
		testFloat(["1", "2.32", "3.0", " 3.2"])
	end

end

IO.inspect Test.toFloat
IO.inspect Test.csv


