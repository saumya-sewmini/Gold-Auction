package lk.sau.ee.core.model;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Validate {
    public static List<AutoBidModel> sortBidConfigs(List<AutoBidModel> autoBidders){
        return autoBidders.stream()
                .sorted(Comparator
                        .comparing(AutoBidModel::getRegisterdAt)
                        .thenComparing(AutoBidModel::getUserId))
                .collect(Collectors.toList());
    }
}
