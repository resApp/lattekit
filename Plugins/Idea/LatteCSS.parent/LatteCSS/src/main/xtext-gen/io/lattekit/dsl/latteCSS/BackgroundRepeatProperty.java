/**
 */
package io.lattekit.dsl.latteCSS;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Background Repeat Property</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link io.lattekit.dsl.latteCSS.BackgroundRepeatProperty#getValues <em>Values</em>}</li>
 * </ul>
 *
 * @see io.lattekit.dsl.latteCSS.LatteCSSPackage#getBackgroundRepeatProperty()
 * @model
 * @generated
 */
public interface BackgroundRepeatProperty extends CSSProperty
{
  /**
   * Returns the value of the '<em><b>Values</b></em>' attribute list.
   * The list contents are of type {@link java.lang.String}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Values</em>' attribute list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Values</em>' attribute list.
   * @see io.lattekit.dsl.latteCSS.LatteCSSPackage#getBackgroundRepeatProperty_Values()
   * @model unique="false"
   * @generated
   */
  EList<String> getValues();

} // BackgroundRepeatProperty