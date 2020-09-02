package com.github.niefy.config;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.IOException;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(toStringConverter());
    }

    /**
     * BigDecimal Long 转化为String
     * @return
     */
    @Bean
    public MappingJackson2HttpMessageConverter toStringConverter() {
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        ObjectMapper mapper = new ObjectMapper();
        /**
         * 日期全局格式化
         * */
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        //GMT+8
        mapper.setTimeZone(TimeZone.getTimeZone("GMT+8"));

        SimpleModule simpleModule = new SimpleModule();
        simpleModule.addSerializer(BigDecimal.class, BigDecimalToStringSerializer.instance);
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        simpleModule.addSerializer(Long.TYPE, ToStringSerializer.instance);
        simpleModule.addSerializer(long.class, ToStringSerializer.instance);
        mapper.registerModule(simpleModule);

        /**　
         // Include.Include.ALWAYS 默认
 　　　　// Include.NON_DEFAULT 属性为默认值不序列化
 　　　　// Include.NON_EMPTY 属性为 空（""） 或者为 NULL 都不序列化，则返回的json是没有这个字段的。这样对移动端会更省流量
 　　　　// Include.NON_NULL 属性为NULL 不序列化
         */
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        // 允许出现特殊字符和转义符
        // mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
        // 允许出现单引号
        mapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);

        converter.setObjectMapper(mapper);
        return converter;
    }

    /**
     * 处理swagger doc.html无法显示问题
     * */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("doc.html").addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
    }

    @JacksonStdImpl
    static class BigDecimalToStringSerializer extends ToStringSerializer {
        public final static BigDecimalToStringSerializer instance = new BigDecimalToStringSerializer();

        public BigDecimalToStringSerializer() {
            super(Object.class);
        }

        public BigDecimalToStringSerializer(Class<?> handledType) {
            super(handledType);
        }

        @Override
        public boolean isEmpty(SerializerProvider prov, Object value) {
            if (value == null) {
                return true;
            }
            String str = ((BigDecimal) value).stripTrailingZeros().toPlainString();
            return str.isEmpty();
        }

        @Override
        public void serialize(Object value, JsonGenerator gen, SerializerProvider provider)
                throws IOException {
            gen.writeString(((BigDecimal) value).stripTrailingZeros().toPlainString());
        }

        @Override
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
            return createSchemaNode("string", true);
        }

        @Override
        public void serializeWithType(Object value, JsonGenerator gen,
                                      SerializerProvider provider, TypeSerializer typeSer)
                throws IOException {
            // no type info, just regular serialization
            serialize(value, gen, provider);
        }
    }
}
