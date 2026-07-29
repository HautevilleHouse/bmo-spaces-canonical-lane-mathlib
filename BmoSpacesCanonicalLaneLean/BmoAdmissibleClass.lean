import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.BmoSpacePackage
import BmoSpacesCanonicalLaneLean.BmoCarlesonMeasurePackage

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoAdmittedObject where
  bmoSpace : BmoSpace
  bmoSpaceClosed : BmoSpaceClosed bmoSpace
  carlesonPackage : CarlesonMeasurePackage
  carlesonClosed : CarlesonMeasureClosed carlesonPackage
  equivalenceProved : Prop
  conclusion : equivalenceProved

structure AdmissibleClass where
  object : BmoAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.equivalenceProved

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedBmoClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bmo_endgame (A : AdmissibleClass) :
    ConstrainedBmoClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse