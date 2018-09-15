module DrawSimpleGraphs
using Plots, SimpleGraphs

export draw

#include("edgeplot.jl")

function draw_one_edge(a,b,c,d,hue="black")
    plot!([a,c],[b,d], color=hue, linewidth=2)
end

function draw_edges(G::SimpleGraph)
    xy = getxy(G)
    hue = get_line_color(G)
    for ee in elist(G)
        u,v = ee
        draw_one_edge(xy[u][1], xy[u][2], xy[v][1], xy[v][2], hue)
    end
end

function draw_one_node(x,y,hue="black", fill="white")
    plot!([x],[y],markerstrokecolor=hue,
                    markercolor=fill, marker=6,
                    markerstrokewidth=2)
end

function draw_nodes(G::SimpleGraph)
    hue = get_line_color(G)
    fill= get_fill_color(G)
    xy = getxy(G)
    for v in vlist(G)
        x,y = xy[v]
        draw_one_node(x,y,hue,fill)
    end
end


function finish()
    plot!(legend=false, aspect_ratio=1, axis=false, grid=false)
end


function draw(G::SimpleGraph)
    if !has_embedding(G)
        embed(G)
    end
    gr()
    plot()
    draw_edges(G)
    draw_nodes(G)
    finish()
end


end  # end of module DrawSimpleGraphs
