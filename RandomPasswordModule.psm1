function New-RandomPassword {
    <#
      .SYNOPSIS
    Generates a random password

  .DESCRIPTION
    Generates a random password with custom length, and custom password policy.
    You set the number of Uppercases, Digits, and Non-Alphanumeric characters to match your policy.

  .PARAMETER Length
    Mandatory. Specifies the length of the password; Example : 8 characters

  .PARAMETER Uppercase
  Optional. Specifies the number of Uppercases the password should have. No Uppercase by default.

  .PARAMETER Digits
  Optional. Specifies the number of Digits the password should have. No Digits by default.

  .PARAMETER SpecialCharacters
    Optional. Specifies the number of Special characters the password should have. No Non-Alphanumeric characters by default.

  .INPUTS
    Parameters above

  .OUTPUTS
    Random password generated.

  .NOTES
    Version: 1.0
    Author: Thibault Baheux
    Creation Date: 22.04.2021
    Purpose/Change: Initial function development.

  .LINK

  .EXAMPLE
    New-RandomPassword -Length 10
    Generates a new random password of 10 characters, with 10 lowercases.
  
    New-RandomPassword -Length 15 -SpecialCharacters 2
    Generates a new random password of 15 characters, with 2 Special characters and 13 lowercases.

    New-RandomPassword -Length 20 -Uppercase 4 -Digits 3 -SpecialCharacters 3
    Generates a new random password of 20 characters, with 3 Special characters, 4 Uppercases and 3 Digits.
    #>

    [CmdletBinding()]
    Param
     (
        [Parameter(Mandatory=$false)][int]$Length,
        [Parameter(Mandatory=$false)][int]$Uppercase,
        [Parameter(Mandatory=$false)][int]$Digits,
        [Parameter(Mandatory=$false)][int]$SpecialCharacters

    )

    Begin {
        if ($Length -le 1) {
          [int]$Length = 9
        }
        if ($Uppercase -le 1) {
          [int]$Uppercase = 1
        }
        if ($Digits -le 1) {
          [int]$Digits = 4
        }
        if ($SpecialCharacters -le 1) {
          [int]$SpecialCharacters = 1
        }
        $Sum = $Uppercase + $Digits + $SpecialCharacters
        if ($Length -lt $Sum) {
          Write-Error "Cannot continue: You should increase password length with current parameters."
          break
        }
        $Lowercase = $Length - $SpecialCharacters - $Uppercase - $Digits
        $ArrayLowerCharacters = @('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
        $ArrayUpperCharacters = @('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
        $ArraySpecialCharacters = @('_','*','$','%','?','!','-','+','/','&','(',')','@',',','.')
        [string]$NewPassword = ""
    }

    Process {
        Try {
          if ($Uppercase -gt 0) {
            $NewPassword += $ArrayUpperCharacters | Get-Random -Count $Uppercase 
          }
          if ($Lowercase -gt 0) {
            $NewPassword += $ArrayLowerCharacters | Get-Random -Count $Lowercase
          }  
          if ($Digits -gt 0) {
            $NewPassword += 0..9 | Get-Random -Count $Digits 
          }

          if ($SpecialCharacters -gt 0) {
            $NewPassword += $ArraySpecialCharacters | Get-Random -Count $SpecialCharacters
          }
          #Removing Whitespace
          $NewPassword = $NewPassword.Replace(' ','')

          
          if ($Length -ne $NewPassword.Length) {
            Write-Error "Generation Error: Password doesn't match specified Length parameter."
            break
          }
        }
        Catch {
            Write-Error $_.Exception
            Break
        }
    }
    End {

        If ($?) {
            $NewPassword | Set-ClipboardText
            Return $NewPassword
        }
    }
}
