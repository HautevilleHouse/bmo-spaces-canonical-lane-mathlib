import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoAdmittedObject where
  space : Type u
  measure : Type v
  bmoNorm : Prop
  boundedOscillation : Prop
  conclusion : bmoNorm

structure AdmissibleClass where
  object : BmoAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BmoWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse