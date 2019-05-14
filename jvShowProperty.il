procedure(jvShowProperty()
  let((promptTable)
    x=car(geGetSelectedSet())
    promptTable = makeTable("cdfPrompts" nil)
    when(x~>objType=="inst"
        cdf = cdfGetInstCDF(x)
        foreach(p cdf~>parameters
            promptTable[p~>name] = p~>prompt
        )
    )
    printf("x = %L (%L)\n" x x~>objType)
    r=rodGetObj(x)
    printf("r = %L\n" r)
    if(x~>prop || x~>viaHeader~>overrideParams then
        printf(" \nProperties on selected object:\n")
        printf("CDF Prompt Property Name (type) Value\n")
        printf("============================================================\n")
        foreach(prop x~>prop
            printf("%-25s = %-25s: %L\n" promptTable[prop~>name]||"no cdf" sprintf(nil "%s (%s)" prop~>name prop~>valueType) prop~>value)
        )
        when(x~>objType=="customVia" || x~>objType=="stdVia"
            printf("%s\n" x~>objType)
            foreach(prop x~>viaHeader~>overrideParams
                printf("%-25s = %-25s: %L\n" promptTable[car(prop)]||"no cdf" sprintf(nil "%s" car(prop) ) cadr(prop))
            )
        )
    else
        printf("No properties on selected object\n")
    )
    t
  )
)
