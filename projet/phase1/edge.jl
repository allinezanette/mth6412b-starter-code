import Base.show

abstract type AbstractEdge{T,C,D} end

mutable struct Edge{T,C,D} <: AbstractEdge{T,C,D}
    name::String
    weight::T
    node1name::String
    node1data::C
    node2name::String
    node2data::D

end

# on présume que tous les edges dérivant d'AbstractEdge
# posséderont des champs `name` et `weight`.

"""Renvoie le nom du node1."""
name(edge::AbstractEdge) = edge.node1name

"""Renvoie le donnees du node1."""
name(edge::AbstractEdge) = edge.node1data

"""Renvoie le nom du node2."""
name(edge::AbstractEdge) = edge.node2name

"""Renvoie le donnees du node2."""
name(edge::AbstractEdge) = edge.node2data

"""Renvoie le nom du edge."""
name(edge::AbstractEdge) = edge.name

"""Renvoie les donnees contenues dans le edge."""
weight(edge::AbstractEdge) = edge.weight

"""Affiche un edge"""
function show(edge::AbstractEdge)
    s = string("Node1 ", node1name(edge), "data: ", node1data(edge),
    "Node2 ", node2name(edge), "data: ", node2data(edge),
    "Edge ", name(edge), ", weight: ", weight(edge))
    println(s)
end
