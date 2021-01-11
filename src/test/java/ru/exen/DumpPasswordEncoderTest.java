package ru.exen;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;

class DumpPasswordEncoderTest {
    @Test
    void encode() {
        DumpPasswordEncoder passwordEncoder = new DumpPasswordEncoder();

        Assertions.assertEquals("secret: 'myPassword'", passwordEncoder.encode("myPassword"));
        assertThat(passwordEncoder.encode("myPassword"), containsString("myPassword"));
    }
}