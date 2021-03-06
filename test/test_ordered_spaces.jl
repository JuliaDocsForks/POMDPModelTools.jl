let
    struct TigerPOMDPTestFixture <: POMDP{Bool, Int, Bool} end

    POMDPs.actions(m::TigerPOMDPTestFixture) = 0:2
    POMDPs.n_actions(m::TigerPOMDPTestFixture) = 3
    POMDPs.actionindex(m::TigerPOMDPTestFixture, s::Int) = s+1

    pomdp = TigerPOMDPTestFixture()

    @test ordered_states(pomdp) == [false, true]
    @test ordered_observations(pomdp) == [false, true]
    @test ordered_actions(pomdp) == [0,1,2]
end

struct TM <: POMDP{Int, Int, Int} end
POMDPs.states(::TM) = [1,3]
POMDPs.n_states(::TM) = 2

@test_throws ErrorException ordered_states(TM())

struct TM2 <: POMDP{Int, Int, Int} end
POMDPs.states(::TM2) = [1,3]
POMDPs.n_states(::TM2) = 3

println("There should be a warning below:")
ordered_states(TM2())
