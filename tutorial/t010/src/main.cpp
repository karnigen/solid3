
#include <stdio.h>
#include <iostream>
#include <sstream>
#include <fmt/format.h>
#include <fmt/ostream.h>


#include "MT_Scalar.h"
#include "MT_ScalarTracer.h"

namespace fmt {
    template <>
    struct formatter<MT_Scalar> {
        template <typename ParseContext>
        constexpr auto parse(ParseContext& ctx) { return ctx.begin(); }

        template <typename FormatContext>
        auto format(const MT_Scalar& obj, FormatContext& ctx) {
            std::ostringstream oss;
            oss << obj;
            return format_to(ctx.out(), "{}", oss.str());
        }
    };
}

int main() {
    MT_Scalar a(1.0,1),b(2.0,1),c;

    c = a + b;

    fmt::print("c = {}\n", c);
    // std::cout << c << std::endl;
    return 0;
}

