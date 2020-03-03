package com.jdbcEntity.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)//只允许使用一种生命周期
@Target(ElementType.TYPE)
@Documented
public @interface tableName {

	String name();
	
}
