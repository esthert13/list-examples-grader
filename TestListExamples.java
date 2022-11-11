import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;

public class TestListExamples {
  @Test
  public void testMerge() {
      List<String> combined = new ArrayList<>(List.of("Apple", "Bunny", "Calculator", "Disaster"));
      List<String> list1 = new ArrayList<>(List.of("Apple", "Bunny"));
      List<String> list2 = new ArrayList<>(List.of("Calculator", "Disaster"));
      assertEquals(combined, ListExamples.merge(list1, list2));
  }

  @Test
  public void testFilter() {
      List<String> combined2 = new ArrayList<>(List.of("ancient", "banned", "believable", "disease"));
      List<String> list1 = new ArrayList<>(List.of("ancient", "believable"));
      List<String> list2 = new ArrayList<>(List.of("banned", "disease"));
      assertEquals(combined2, ListExamples.merge(list1, list2));
  }
}
