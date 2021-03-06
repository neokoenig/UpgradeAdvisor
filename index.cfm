<cfoutput>

  <cfset _plugin = application.wheels.plugins.upgradeadvisor.init()>
  <cfset results = _plugin.main()>

  <h1>Wheels 2.x Upgrade Advisor</h1>
  <h3>Checks your Wheels 1.x application for compatibility with Wheels 2.x.</h3>

  <cfloop array="#results#" index="i">
    <cfif i.success>
      <h2>#i.name#</h2>
      <span style="color: green;">No issues found.</span>
      <div style="border-top:1px solid silver; margin-top:20px;"></div>
    </cfif>
  </cfloop>
  <cfloop array="#results#" index="i">
    <cfif !i.success>
      <h2>#i.name#</h2>
      <ul>
      <cfloop array="#i.messages#" index="m">
        <li>#m.message#</li>
      </cfloop>
      </ul>
      <cfif Len(i.href)>#linkTo(text="More info", href=i.href, target="_blank")#</cfif>
      <div style="border-top:1px solid silver; margin-top:20px;"></div>
    </cfif>
  </cfloop>

  <div align="center" style="font-size:0.8em;">Upgrade Advisor V#_plugin.pluginVersion()#</div>
</cfoutput>
