Import-Module .\ErrorHandlingTestCommands.psm1 -ErrorAction Stop

# All tests performed with both a compiled c# cmdlet (using PSCmdlet.WriteError() and PSCmdlet.ThrowTerminatingError()), and
# with a PowerShell advanced function (using Write-Error and throw), to determine if there are any differences between
# their behavior.

#
# Demonstrating behavior of $error, -ErrorVariable, and (when using try/catch) $_
#

""
"**********************************************"
"* Advanced Function, Terminating Errors only *"
"**********************************************"
""

try
{
    $error.Clear()
    1..3 | Test-FunctionErrors -Terminating -ErrorVariable errorVariable
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    "" 
    "`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
    "`$errorVariable.Count: $($errorVariable.Count)"    

    for ($i = 0; $i -lt $errorVariable.Count; $i++)
    {
        ""
        "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"
        
        if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
        }
    }

    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"***********************************************************"
"* Advanced Function, Non-Terminating and ErrorAction Stop *"
"***********************************************************"
""

try
{
    $error.Clear()
    1..3 | Test-FunctionErrors -NonTerminating -ErrorVariable errorVariable -ErrorAction Stop
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    "" 
    "`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
    "`$errorVariable.Count: $($errorVariable.Count)"    

    for ($i = 0; $i -lt $errorVariable.Count; $i++)
    {
        ""
        "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"
        
        if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
        }
    }

    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"*************************************************************"
"* Advanced Function, Terminating and Non-Terminating Errors *"
"*************************************************************"
""

try
{
    $error.Clear()
    1..3 | Test-FunctionErrors -NonTerminating -Terminating -ErrorVariable errorVariable -ErrorAction SilentlyContinue
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    ""
    "`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
    "`$errorVariable.Count: $($errorVariable.Count)"    

    for ($i = 0; $i -lt $errorVariable.Count; $i++)
    {
        ""
        "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"
        
        if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
        }
    }

    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"**************************************************"
"* Advanced Function, Non-Terminating Errors Only *"
"**************************************************"
""

$error.Clear()
1..3 | Test-FunctionErrors -NonTerminating -ErrorVariable errorVariable -ErrorAction SilentlyContinue

"`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
"`$errorVariable.Count: $($errorVariable.Count)"    

for ($i = 0; $i -lt $errorVariable.Count; $i++)
{
    ""
    "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"

    if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
    {
        "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
    }
    elseif ($errorVariable[$i].ErrorRecord -ne $null)
    {
        "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
    }
}

""
"`$error.Count: $($error.Count)"

for ($i = 0; $i -lt $error.Count; $i++)
{
    ""
    "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
    if ($error[$i] -is [System.Management.Automation.ErrorRecord])
    {
        "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
    }
    elseif ($errorVariable[$i].ErrorRecord -ne $null)
    {
        "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
    }
}

""
"***********************************"
"* Cmdlet, Terminating Errors only *"
"***********************************"
""

try
{
    $error.Clear()
    1..3 | Test-CmdletErrors -Terminating -ErrorVariable errorVariable
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    ""
    "`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
    "`$errorVariable.Count: $($errorVariable.Count)"    

    for ($i = 0; $i -lt $errorVariable.Count; $i++)
    {
        ""
        "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"

        if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
        }
    }

    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"************************************************"
"* Cmdlet, Non-Terminating and ErrorAction Stop *"
"************************************************"
""

try
{
    $error.Clear()
    1..3 | Test-CmdletErrors -NonTerminating -ErrorVariable errorVariable -ErrorAction Stop
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    "" 
    "`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
    "`$errorVariable.Count: $($errorVariable.Count)"    

    for ($i = 0; $i -lt $errorVariable.Count; $i++)
    {
        ""
        "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"
        
        if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
        }
    }

    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"**************************************************"
"* Cmdlet, Terminating and Non-Terminating Errors *"
"**************************************************"
""

try
{
    $error.Clear()
    1..3 | Test-CmdletErrors -NonTerminating -Terminating -ErrorVariable errorVariable -ErrorAction SilentlyContinue
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    "" 
    "`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
    "`$errorVariable.Count: $($errorVariable.Count)"    

    for ($i = 0; $i -lt $errorVariable.Count; $i++)
    {
        ""
        "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"
        
        if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
        }
    }

    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"***************************************"
"* Cmdlet, Non-Terminating Errors Only *"
"***************************************"
""

$error.Clear()

1..3 | Test-CmdletErrors -NonTerminating -ErrorVariable errorVariable -ErrorAction SilentlyContinue

"`$errorVariable.GetType().FullName: $($errorVariable.GetType().FullName)"
"`$errorVariable.Count: $($errorVariable.Count)"

for ($i = 0; $i -lt $errorVariable.Count; $i++)
{
    ""
    "`$errorVariable[$i].GetType().FullName: $($errorVariable[$i].GetType().FullName)"

    if ($errorVariable[$i] -is [System.Management.Automation.ErrorRecord])
    {
        "`$errorVariable[$i].Exception.Message: $($errorVariable[$i].Exception.Message)"
    }
    elseif ($errorVariable[$i].ErrorRecord -ne $null)
    {
        "`$errorVariable[$i].ErrorRecord.Exception.Message: $($errorVariable[$i].ErrorRecord.Exception.Message)"
    }
}

""
"`$error.Count: $($error.Count)"

for ($i = 0; $i -lt $error.Count; $i++)
{
    ""
    "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
    if ($error[$i] -is [System.Management.Automation.ErrorRecord])
    {
        "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
    }
    elseif ($errorVariable[$i].ErrorRecord -ne $null)
    {
        "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
    }
}



""
"***************************************"
"* .NET Function that throws Exception *"
"***************************************"
""

try
{
    $error.Clear()
    [ErrorTestClass]::MethodThatThrowsException()
}
catch
{
    "`$_.GetType().FullName: $($_.GetType().FullName)"
    "`$_.Exception.Message: $($_.Exception.Message)"
    ""
    "`$error.Count: $($error.Count)"

    for ($i = 0; $i -lt $error.Count; $i++)
    {
        ""
        "`$error[$i].GetType().FullName: $($error[$i].GetType().FullName)"
        
        if ($error[$i] -is [System.Management.Automation.ErrorRecord])
        {
            "`$error[$i].Exception.Message: $($error[$i].Exception.Message)"
        }
        elseif ($errorVariable[$i].ErrorRecord -ne $null)
        {
            "`$error[$i].ErrorRecord.Exception.Message: $($error[$i].ErrorRecord.Exception.Message)"
        }
    }
}

""
"***********************************************************************"
"* Advanced Function, Terminating Error, -ErrorAction SilentlyContinue *"
"***********************************************************************"
""

Test-FunctionErrors -Terminating -ErrorAction SilentlyContinue

""
"************************************************************"
"* Cmdlet, Terminating Error, -ErrorAction SilentlyContinue *"
"************************************************************"
""

Test-CmdletErrors -Terminating -ErrorAction SilentlyContinue

""
"*********************************************************************************"
'* Advanced Function, Terminating Error, $ErrorActionPreference SilentlyContinue *'
"*********************************************************************************"
""

$ErrorActionPreference = 'SilentlyContinue'
Test-FunctionErrors -Terminating
$ErrorActionPreference = 'Continue'

""
"**********************************************************************"
'* Cmdlet, Terminating Error, $ErrorActionPreference SilentlyContinue *'
"**********************************************************************"
""

$ErrorActionPreference = 'SilentlyContinue'
Test-CmdletErrors -Terminating
$ErrorActionPreference = 'Continue'

""
"******************************************************************"
'* .NET Method Exception, $ErrorActionPreference SilentlyContinue *'
"******************************************************************"
""

$ErrorActionPreference = 'SilentlyContinue'
[ErrorTestClass]::MethodThatThrowsException()
$ErrorActionPreference = 'Continue'

""
"******************************************************************"
"* Terminating Error Without Rethrow, Cmdlet                      *"
"******************************************************************"
""

Test-WithoutRethrow -Cmdlet -Terminating

""
"******************************************************************"
"* Terminating Error Without Rethrow, .NET Method                 *"
"******************************************************************"
""

Test-WithoutRethrow -Method

""
"******************************************************************"
"* Terminating Error Without Rethrow, Unknown command             *"
"******************************************************************"
""

Test-WithoutRethrow -UnknownCommand
