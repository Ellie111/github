package com.jdbcEntity.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
* @ClassName: identityKeyAnno 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author 
* @date
*/
@Documented
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD, ElementType.FIELD })
public @interface identityKey {
	
	String name() default "";  
	
}
