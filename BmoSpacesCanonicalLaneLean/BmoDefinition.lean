import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoSpace where
  underlyingSpace : Type u
  sigmaAlgebra : underlyingSpace → Prop
  measure : underlyingSpace → ℝ
  bmoSeminorm : (underlyingSpace → ℝ) → ℝ
  bmoDefiningCondition : Prop
  johnNirenbergConstant : ℝ

structure BmoPackage where
  space : BmoSpace
  bmoNormDefined : Prop
  inclusionLp : Prop
  feffermanSteinDecomposition : Prop

def BmoWitnessClosed (O : BmoAdmittedObject) : Prop :=
  O.bmoNorm

structure BmoEvidence (P : BmoPackage) where
  bmoNormDefinedClosed : P.bmoNormDefined
  inclusionLpClosed : P.inclusionLp
  feffermanSteinDecompositionClosed : P.feffermanSteinDecomposition

def BmoClosed (P : BmoPackage) : Prop :=
  P.bmoNormDefined ∧ P.inclusionLp ∧ P.feffermanSteinDecomposition

theorem bmo_closed_from_evidence (P : BmoPackage) (E : BmoEvidence P) : BmoClosed P := by
  exact And.intro E.bmoNormDefinedClosed (And.intro E.inclusionLpClosed E.feffermanSteinDecompositionClosed)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse