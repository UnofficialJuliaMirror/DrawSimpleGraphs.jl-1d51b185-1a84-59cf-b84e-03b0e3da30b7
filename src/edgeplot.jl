
"""
`edgeplot(a,b,c,d)` plots an edge from `(a,b)` to `(c,d)`
"""
function edgeplot(a,b,c,d)
    plot!([a,c],[b,d], color="black", linewidth=2)
end

function nodeplot(a,b,hue="black", fill="white")
    Plots.plot!([a],[b],marker=5,
            markercolor=fill,
            markerstrokecolor=hue, markerstrokewidth=2)
end

function finish()
    plot!(legend=false, aspect_ratio=1, axis=false, grid=false)
end

function example()
    Plots.gr()
    Plots.plot()
    a,b,c,d,e,f = 1,3,2,0,5,5
    edgeplot(a,b,c,d)
    edgeplot(c,d,e,f)
    nodeplot(a,b)
    nodeplot(e,f)
    nodeplot(c,d)
    finish()
end
