package generic;

import java.util.Objects;

public class Util <K,V>{
    public static <K extends Pair,V> Integer getValue(K pair,V key) {
        if (Objects.equals(pair.getKey(), key)) {
            return (Integer) pair.getValue();
        } else {
            return null;
        }
    }

    }

