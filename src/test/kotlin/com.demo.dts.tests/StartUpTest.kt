package com.demo.dts.tests

import com.demo.dts.sayHi
import kotlin.test.assertEquals
import org.junit.Test

class MainTest {
    @Test fun testHi() : Unit {
        assertEquals("hi", sayHi())
    }
}
