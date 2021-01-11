package ru.exen.example;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class SimpleTest {
    @Test
    public void test(){
        int x = 2;
        int y = 10;

        Assertions.assertEquals(12, x + y);
        Assertions.assertEquals(20, x * y);
    }
}
