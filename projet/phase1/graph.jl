import Base.show

abstract type AbstractEdge{T} end

"""
Example:

    node1 = Node("Joe", 3.14)
    node2 = Node("Steve", exp(1))
    edge1 = Edge([node1,node2], 1)

"""

mutable struct Edge{T} <: AbstractEdge{T}
    bounds::Vector{Node{T}}
    weight::Float64
end

# we assume that all the edges coming from AbstractEdge have 'name' and 'weight'.

"""return the bounds of the edge."""
bounds_edge(edge::AbstractEdge) = edge.bounds

"""Return the weight of the edge."""
weight(edge::AbstractEdge) = edge.weight

"""displaying an edge"""
function show(edge::AbstractEdge)
    s = string("Edge: ", bounds_edge(edge), ", weight: ", weight(edge))
    println(s)
end
