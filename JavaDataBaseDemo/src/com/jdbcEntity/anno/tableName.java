package com.jdbcEntity.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)//ֻ����ʹ��һ����������
@Target(ElementType.TYPE)
@Documented
public @interface tableName {

	String name();
	
}
