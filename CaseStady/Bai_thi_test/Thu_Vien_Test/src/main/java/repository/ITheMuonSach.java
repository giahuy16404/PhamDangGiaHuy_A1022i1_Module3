package repository;

import bean.TheMuonSach;

import java.util.List;

public interface ITheMuonSach {
    List<TheMuonSach> showList();
    boolean addTheMuonSach(TheMuonSach theMuonSach);
}
