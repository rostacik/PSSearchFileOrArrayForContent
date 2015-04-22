function Array-Contains-Row {
	[CmdletBinding()]
	Param([array]$fileContent, [string]$searchedString)

	Process {
		#is there any string we search for in any of the rows?
		[array]$resArray = $fileContent | where { $_ | Select-String –caseSensitive -Pattern $searchedString }

		if ($resArray.Count -eq 0) {
			return $false
		} else {
			return $true
		}
	}
}

#array sample
$inputArr = ('aa', 'bb', 'cd')
$outputArr = Array-Contains-Row -fileContent $inputArr -searchedString 'aa'

#file sample
$inputFile = (get-content 'absolute path')
$outputFile = Array-Contains-Row -fileContent $inputFile -searchedString 'what we search for'