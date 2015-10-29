/*
 * generated by Xtext
 */
package io.lattekit.dsl.layout;

import io.lattekit.dsl.layout.jvmmodel.LayoutCompiler;
import io.lattekit.dsl.layout.typesystem.LayoutTypeComputer;

import org.eclipse.xtext.xbase.compiler.XbaseCompiler;
import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputer;


/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
public class LayoutRuntimeModule extends io.lattekit.dsl.layout.AbstractLayoutRuntimeModule {
	
//	@Override
//	public Class<? extends IValueConverterService> bindIValueConverterService() {
//		return LayoutValueConverterService.class;
//	}
//	
	public Class<? extends XbaseCompiler> bindXbaseCompiler() {
		return LayoutCompiler.class;
	}
//
	public Class<? extends ITypeComputer> bindITypeComputer() {
		return LayoutTypeComputer.class;
	}
//	
	
	
	
//	
//	
//	@SingletonBinding(eager=true)	
//	@Override
//	public Class<? extends AbstractLayoutValidator> bindAbstractLayoutValidator() {
//		return LayoutValidator.class;
//	}

}