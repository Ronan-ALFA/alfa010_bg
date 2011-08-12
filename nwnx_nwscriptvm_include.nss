/*++

Copyright (c) Ken Johnson (Skywing). All rights reserved.

Module Name:

	nwnx_nwscriptvm_include.nss

Abstract:

	This module defines APIs that are provided by the NWScriptVM plugin.

--*/

void
NWScriptVM_LogStatistics(
	)
/*++

Routine Description:

	This routine logs current NWScript usage statistics to the plugin log file.

Arguments:

	None.

Return Value:

	None.

Environment:

	Any script caller.

--*/
{
	NWNXGetInt( "NWSCRIPTVM", "LOG SCRIPT STATISTICS", "", 0 );
}

void
NWScriptVM_SetReferenceVM(
	int UseReferenceVM
	)
/*++

Routine Description:

	This routine sets whether the script host prefers the reference VM or the
	JIT engine for future script compilation.  Note that already cached scripts
	are not necessarily immediately impacted by the request.

Arguments:

	UseReferenceVM - Supplies a Boolean value that indicates a zero value if the
	                 server should prefer to JIT scripts, else a non-zero value
	                 if the server should prefer to use the reference VM for
	                 scripts.

Return Value:

	None.

Environment:

	Any script caller.

--*/
{
	NWNXGetInt(
		"NWSCRIPTVM",
		"SET REFERENCE VM",
		"",
		UseReferenceVM ? TRUE : FALSE );
}

void
NWScriptVM_ClearScriptCache(
	)
/*++

Routine Description:

	This routine clears the script host's cached script list.  The cache
	maintains state about which scripts have been JIT'd and which have been
	slated for execution in the reference VM.

Arguments:

	None.

Return Value:

	None.

Environment:

	Any script caller.

--*/
{
	NWNXGetInt( "NWSCRIPTVM", "CLEAR SCRIPT CACHE", "", 0 );
}

int
NWScriptVM_GetAvailableVASpace(
	)
/*++

Routine Description:

	This routine returns an estimate of the amount of virtual address space that
	is free on the server process.  The estimate does not represent contiguous
	free VA ranges and it does not represent a guarantee of future ability to
	satisfy any allocations successfully.

	N.B.  The returned value has 32 significant bits, that is, the sign bit is
	      used as an additional data bit.  The return value is unsigned but the
	      scripting environment does not provide native unsigned integer math.

Arguments:

	None.

Return Value:

	An estimate of the available VA space in the server process is returned.
	The estimate may be less than zero because it is an unsigned quantity.

Environment:

	Any script caller.

--*/
{
	return NWNXGetInt( "NWSCRIPTVM", "GET AVAILABLE VA SPACE", "", 0 );
}
