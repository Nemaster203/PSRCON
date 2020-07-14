<#
.SYNOPSIS
	An RCON module written in PowerShell
#>

# TODO: All of the comment-based help. Or add updatable help.
# Reference: https://developer.valvesoftware.com/wiki/Source_RCON_Protocol

Function Connect-Rcon
{
	[CmdletBinding()]
	# Returns PSCustomObject with connected Rcon object
	Param
	(
		[Parameter(Mandatory	=	$True)]
			[System.Uri]
			$Server, # Make sure to specify the port here too.

		[Parameter(Mandatory	=	$True)]
			[PSCredential]
			$Credential,

		[Parameter(Mandatory	=	$False)]
			[ValidateSet('Factorio')] # TODO: Additional RCON flavours, such as 'Source', 'Minecraft', etc.
			[String]
			$RconType			=	'Factorio' # TODO: See if this can be auto-detected.
	)
	# TODO: Create TCP connection.
	# TODO: Authenticate TCP/RCON connection.
	# SERVERDATA_AUTH
}

Function Disconnect-Rcon
{
	[CmdletBinding()]
	# Returns Boolean
	Param
	(
		[Parameter(Mandatory	=	$True)]
			[PSCustomObject]
			$RconConnection
	)
	# TODO: Close and dispose TCP connection.
}

Function Send-RconMessage
{
	[CmdletBinding()]
	# Returns the result. TODO: Determine data type for return object.
	Param
	(
		[Parameter(Mandatory	=	$True)]
			[PSCustomObject]
			$RconConnection,

		[Parameter(Mandatory	=	$True)]
			[String]
			$Command
	)
	# SERVERDATA_EXECCOMMAND
	$Body						=	@{
		'Size'					=	[Int32]'' # TODO: These values. Might be automagic with the TCP connection.
		'ID'					=	[Int32](Get-Random -Minimum [Int32]::MinValue -Maximum [Int32]::MaxValue) # 32-bit Little-Endian Signed Integer
		'Type'					=	[Int32]2 # SERVERDATA_EXECCOMMAND
		'Body'					=	$Command # TODO: Ensure this is Null-terminated ASCII-encoded.
	}
}

Export-ModuleMember -Function 'Connect-Rcon', 'Send-RconMessage'